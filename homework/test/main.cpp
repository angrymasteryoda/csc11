/* 
 * File:   main.cpp
 * Author: michael
 *
 * Created on September 29, 2015, 1:01 PM
 */

#include <cstdlib>
#include <iostream>

using namespace std;

/*
 * 
 */
void divShift();
int main(int argc, char** argv) {
    int r0 = 0;
    int r1 = 55;  //r1 = 45 
    //int r2 = 6;   //r2 = 6
    int r3 = 1;   //r3 = 1 scale
    int r4 = 6;   //r4 = 6 shifting subtractor
    int r5 = 0;   //r5 = 0 counter
    //*
    do{
        r4 <<= 1;
        r3 <<= 1;
    } while( r4 < r1 );
    
    r4 >>= 1;
    r3 >>= 1;
    
    while( r4 <= r1 ){
        r5 = r5 + r3;
        r1 = r1 - r4;
        while( r4 > 1 && r3 > r1 ){
            r4 >>= 1;
            r3 >>= 1;
        }
    }
    
    
    cout << "r0: " << r0;
    cout << " r1: " << r1;
//    cout << " r2: " << r2;
    cout << " r3: " << r3;
    cout << " r4: " << r4;
    cout << " r5: " << r5 << endl;
    //*/
    divShift();
    return 0;
}

void divShift(){
    unsigned int r0;//result of r3%r4 start with numerator
    unsigned int r1; //result of r5/r4 start with 0
    unsigned int r2;//increment val start with 1
    unsigned int r3;//decrement value start with denominator
    
    unsigned int r4 = 6;//denominatior
    unsigned int r5 = 55;
    r0=r5;
    r1=0;
    r2=1;
    r3=r4;
    
    //shift the denominator left until greater numerator the shift back
    do{
        r3<<=1;
        r2<<=1;
    } while( r0< r3 );
    r3>>=1;
    r2>>=1;
    while( r0 >= r3 ){
        r1+=r2;
        r0-=r3;
        while( r2>1 && r3>r0){
            r2>>=1;
            r3>>=1;
        }
    }
    
    cout << r5 << "/"<< r4 <<"=" << r1 <<endl;
    cout << r5 << "/"<< r4 <<"=" <<r0 <<endl;
}



/*
division peusdo
1: shift left to scale
2: subtraction
3: shift right and repeat 2 



using a different number

45/6
101101
110

r1 = 45
r2 = 6
r3 = 1 // scale
r4 = 6
r5 = 0  //counter

compare 45 and 6 
	6 is less
	shift left on both r4, r3
	r4 = 12
	r3 = 2
	goto compare
		is less
		shift left on both r4, r3
		r4 = 23
		r3 = 4
		goto compare
			is more 
			shift right on both r4, r3
	subtract r1, r1, r4
	101101
	-11000
	______
	 10101
	 add r3 into r5
	 shift right r3r4
	 compare
	 1100 less than 10101
		less
		10101
		-1100
		 1001
		 add r3 into r5
		 shift right r3r4
		 compare
		 101 less than 110
		 1001
		 -110
		 ____
		   11
		

each time you shift add to counter
 */