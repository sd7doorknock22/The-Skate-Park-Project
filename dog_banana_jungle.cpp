#include <iostream>
#include <string>

using namespace std;

class Skatepark {
private:
    string skateparkName;
    string location;
    double skateparkSize;
    
public:
    Skatepark(string name, string loc, double size) {
        skateparkName = name;
        location = loc;
        skateparkSize = size;
    }
    string getName() {
        return skateparkName;
    }
    string getLocation() {
        return location;
    }
    double getSize() {
        return skateparkSize;
    }
};

class Skater {
private:
    string skaterName;
    int age;
    string skateStyle;

public:
    Skater(string name, int age, string style) {
        skaterName = name;
        this->age = age;
        skateStyle = style;
    }
    string getName() {
        return skaterName;
    }
    int getAge() {
        return age;
    }
    string getStyle() {
        return skateStyle;
    }
};

void printParkInfo(Skatepark park) {
    cout << "Skatepark: " << park.getName() << endl;
    cout << "Location: " << park.getLocation() << endl;
    cout << "Size: " << park.getSize() << endl;
}

void printSkaterInfo(Skater skater) {
    cout << "Name: " << skater.getName() << endl;
    cout << "Age: " << skater.getAge() << endl;
    cout << "Skate Style: " << skater.getStyle() << endl;
}

int main() {
    Skatepark park1("The Ramp", "Denver, CO", 2000);
    Skater skater1("John Doe", 17, "Street");

    printParkInfo(park1);
    cout << endl;
    printSkaterInfo(skater1);

    return 0;
}