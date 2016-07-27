typedef pair<double, double> dd;

const double epsilon = 1e-6;

struct sort_by_polar_angle {
    dd center;
    // Constuctor of any type
    // Just find and store the center
    template<typename T> sort_by_polar_angle(T b, T e) {
        int count = 0;
        center = dd(0,0);
        while(b != e) {
            center.first += b->first;
            center.second += b->second;
            b++;
            count++;
        }
        double k = count ? (1.0/count) : 0;
        center.first *= k;
        center.second *= k;
    }
    // Compare two points, return true if the first one is earlier
    // than the second one looking by polar angle
    // Remember, that when writing comparator, you should
    // override not ‘operator <’ but ‘operator ()’
    bool operator () (const dd& a, const dd& b) const {
        double p1 = atan2(a.second-center.second, a.first-center.first);
        double p2 = atan2(b.second-center.second, b.first-center.first);
        return p1 + epsilon < p2;
    }
};

// ...

vector<dd> points;

// ...

sort(all(points), sort_by_polar_angle(all(points)));
