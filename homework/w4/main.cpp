#include <iostream>
using namespace std;

int main(int argc, char** argv) {
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
    return 0;
}
