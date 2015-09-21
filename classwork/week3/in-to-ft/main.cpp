/* 
 * File:   main.cpp
 * Author: Dr. Mark E. Lehr
 * Created on September 20, 2015, 3:52 PM
 * Purpose: Checkout C++ code before converting to Assembly
 */

//System Libraries
#include <iostream> //I/O stream
using namespace std;

//User Libraries

//Global Constants
const float CNVINFT=1.0f/12.0f;

//Function Prototypes

//Execution begins here
int main(int argc, char** argv) {
    //C++ Check
        //Declare variables
        unsigned char in=108;
        unsigned char ft=CNVINFT*in;
        cout<<static_cast<int>(in)<<"(in) = "
                <<static_cast<int>(ft)<<"(ft)"<<endl;
        cout<<"Float Conversion in to ft = "<<CNVINFT<<endl;
    //Hex Assembly implementation
        //Declare variables
        unsigned char R1=in;        //BP  0WD 7
        unsigned int  R2=0x00155556;//BP-24WD24
        unsigned int  R0=R2*R1;     //BP-24WD31
        R0>>=24;                    //BP  0WD 7
        cout<<static_cast<int>(R1)<<"(in) = "
                <<static_cast<int>(R0)<<"(ft)"<<endl;
        cout<<"Hex Conversion in to ft = "<<R2<<endl;
    //Binary Assembly implementation
        //Declare variables
        unsigned char R4=in;                        //BP  0WD 7
        unsigned int  R5=0b000101010101010101010110;//BP-24WD24
        unsigned int  R3=R5*R4;                     //BP-24WD31
        R3>>=24;                                    //BP  0WD 7
        cout<<static_cast<int>(R4)<<"(in) = "
                <<static_cast<int>(R3)<<"(ft)"<<endl;
        cout<<"Binary Conversion in to ft = "<<R5<<endl;
    //Binary Assembly implementation
        //Declare variables
        unsigned char R7=in;                     //BP  0WD 7
        unsigned int  R8=0b101010101010101010110;//BP-24WD24
        unsigned int  R6=R8*R7;                  //BP-24WD31
        R6>>=24;                                 //BP  0WD 7
        cout<<static_cast<int>(R7)<<"(in) = "
                <<static_cast<int>(R6)<<"(ft)"<<endl;
        cout<<"Binary Conversion in to ft = "<<R8<<endl;
    //Exit stage right
    return 0;
}
