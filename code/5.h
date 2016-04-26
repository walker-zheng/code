#include "sock2.h"
#include <time.h>

#if RFC_868
// TIME (RFC 868) version
int main(){
    IP::address a("time-c.nist.gov", 37);

    IP::TCP::socket s(a);
    DWORD t;
    s.read(t);
    time_t now = htonl(t) - 2208988800L;
    struct tm *n = localtime(&now);
    std::cout << n->tm_year + 1900 << "/" << n->tm_mon << "/" << n->tm_mday
        << "\t" << n->tm_hour << ":" << n->tm_min << ":" << n->tm_sec << "\n";
}

#else
// SNTP (RFC 4330) version
struct ntp_packet {
    // conversion from NTP epoch to Unix/Windows epoch (midnight jan 1, 1900 to midnight jan 1, 1970).
    static const int epoch = (86400U * (365U * 70U + 17U));
    static const int port = 123;
    static const int timeout = 6000;

    unsigned char mode_vn_li;
    unsigned char stratum;
    char poll;
    char precision;

    unsigned long root_delay;
    unsigned long root_dispersion;
    unsigned long reference_identifier;
    unsigned long reference_timestamp_secs;
    unsigned long reference_timestamp_fraq;
    unsigned long originate_timestamp_secs;
    unsigned long originate_timestamp_fraq;
    unsigned long receive_timestamp_seqs;
    unsigned long receive_timestamp_fraq;
    unsigned long transmit_timestamp_secs;
    unsigned long transmit_timestamp_fraq;

    ntp_packet() {
        memset(this, 0, sizeof(*this));
        mode_vn_li = (4 << 3) | 3;
        originate_timestamp_secs = htonl(time(0) + epoch);
    }

    operator time_t() { return ntohl(transmit_timestamp_secs) - epoch; }
};

int main() {
    IP::address a("time-c.nist.gov", ntp_packet::port);
    IP::UDP::socket s;

    int timeout = ntp_packet::timeout;
    s.setopt(SO_RCVTIMEO, timeout);

    ntp_packet packet;
    s.send(packet, a);
    s.read(a, packet);
    time_t now = (time_t) packet;
    struct tm *n = localtime(&now);
    std::cout << n->tm_year + 1900 << "/" << n->tm_mon+1 << "/" << n->tm_mday
        << "\t" << n->tm_hour << ":" << n->tm_min << ":" << n->tm_sec << "\n";
}

#endif
