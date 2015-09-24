/* 
 * File:   main.cpp
 * Author: rcc
 * pascal triangle recursion
 * Created on August 20, 2014, 2:45 PM
 */

#include <iostream>
//#include <cstdlib>
using namespace std;

int coeff( int row, int col);
int main(int argc, char** argv) {
    static int counter;
    int nr = 20;
    //loop on rows and cols
    for( int r = 1; r <= nr; r++ ){
        for( int c = 1; c <= r; c++){
            coeff( r, c );
        }
        //cout << endl;
    }
    
    //cout<< counter;
    return 0;
}


int coeff( int r, int c ){
    static int count;
    //always init to zero by default
    count++;
    //row and column
    if( r < 1 || c < 1 ){
        return 0;
    }
    
    if( c == 1 ) {
        return 1;
    } 
    if ( r == c ) {
        return 1;
    } 
//    int n1 = 0, n2 = 0;
    if( r == 20 )cout<<"r="<<r<<"c="<<c<<"count = "<<count << endl;
    return coeff( r-1, c-1) + coeff( r-1, c);
}

