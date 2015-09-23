#include <iostream>
using namespace std;

const int PI = 3.141592653589793238462643383279;
void p1();
void p2();
void p3();
void p4();
void p5();


int main(int argc, char** argv) {
    p4();
    p2();
    return 0;
}

void p5(){}
void p4(){
    unsigned int in = 6;
    unsigned int pi = PI;
    cout << "simple math " << in * pi << endl;
    
    unsigned int r1 = in;
    unsigned int r2 = 0x003243f6; // bp -20 wd 24
    unsigned int r0 = r1 * r2;
    r0 >>= 20;
    cout << "hex math " << r0 << endl;;
    
    unsigned int r3 = in;
    unsigned int r4 = 0b11100100100001111110110; // bp -20 wd 24
    unsigned int r5 = r3 * r4;
    r5 >>= 20;
    cout << "bin math " << r5 << endl;
}
void p3(){}
void p2(){
    unsigned int in = 110; //bp 0 wd 7
    unsigned int pi = PI;
    cout << "simple math " << in / pi << endl;
    
    unsigned int r1 = in;
    unsigned int r2 = 0x00517cc1; // bp -24 wd 24
    unsigned int r0 = r1 * r2;
    r0 >>= 24;
    cout << "hex math " << r0 << endl;;
    
    unsigned int r3 = in;
    unsigned int r4 = 0b010100010111110011000001; // bp -24 wd 24
    unsigned int r5 = r3 * r4;
    r5 >>= 24;
    cout << "bin math " << r5 << endl;
}

void p1(){
    unsigned int in = 88;
    unsigned int inB = 0b111010; //bp 0 width 6
    unsigned int conB = 0b00010101; //bp -8 width 8

    unsigned char r1 = in;
    unsigned int r2 = 0x00000015; //bp-8 width 8
    unsigned int r0 = r2*r1;
    r0 >>= 8;
    cout << static_cast<int> (r1) << "(m) = " << static_cast<int> (r0) << "(y)" << endl;
    cout << "hex Conversion in to ft = " << r2 << endl;

    unsigned char R4 = in; //BP  0WD 7
    unsigned int R5 = conB; //BP-24WD24
    unsigned int R3 = R5*R4; //BP-24WD31
    R3 >>= 8; //BP  0WD 7
    cout << static_cast<int> (R4) << "(m) = " << static_cast<int> (R3) << "(y)" << endl;
    cout << "Binary Conversion in to ft = " << R5 << endl;
}
