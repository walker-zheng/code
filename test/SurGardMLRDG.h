struct Surgard
{
    enum { Basic = 0, Heartbeat, ContactID };
};
#pragma pack(1)

//  1RRLssssAAAAAAssGYYY[DC4]                   // basic signal
struct SurgardBasic
{
    unsigned char           protocol_id;        //  Protocol ID
    uint16_t                recv_num;           //  Receiver number
    unsigned char           line_card_id;       //  Line Card ID – can be ‘1’ to ‘2‘ for line cards 1 – 2
    unsigned char           _none_1[4];
    unsigned char           account_num[6];     //  Account number
    unsigned char           _none_2[4];
    unsigned char           area_group_num;     //  Group/Area number
    unsigned char           event_code[3];      //  Class and event code
    unsigned char           term_code;          //  Terminator, 014h
};

//  1RR0sssssssssss@ssss[DC4]                   // heart beat
struct SurgardHeartbeat
{
    unsigned char           protocol_id;        //  Protocol ID
    uint16_t                recv_num;           //  Receiver number
    unsigned char           zero;
    unsigned char           _none_1[11];
    unsigned char           heart_beat;         //  Heart-beat signal
    unsigned char           _none_2[4];
    unsigned char           term_code;          //  Terminator, 014h
};

//  5RRLs18AAAAQXXXYYZZZ[DC4]                   // contact id
struct SurgardContactID
{
    unsigned char           protocol_id;        //  Protocol ID
    uint16_t                recv_num;           //  Receiver number
    unsigned char           line_card_id;       //  Line Card ID – can be ‘1’ to ‘2‘ for line cards 1 – 2
    unsigned int            account_num;        //  Account number
    //  Event Qualifier E – new event or open, R – restore or close, P – previous event
    unsigned char           event_qualifier;
    unsigned char           event_code[3];      //  Class and event code
    uint16_t                area_group_num;     //  Group/Area number
    unsigned char           zone_user_num[3];   //  Zone/User number
    unsigned char           term_code;          //  Terminator, 014h
};
#pragma pack()
