/* 
 * File:   main.cpp
 * Author: rcc
 *
 * Created on November 2, 2015, 8:01 AM
 */

#include <cstdlib>
#include <iostream>
#include <ctime>
#include <stdio.h>

using namespace std;
//data
int n1;
int n2;
int n3;
char* inStr;
char y = 'y';
char n = 'n';
//registers
int r0; int r1; int r2; int r3; int r4; int r5; int r6; int r7; int r8; int r9; int r10; int r11; int r12; int lr;

void gRand(){
    int ran = rand();
    r0 = ran % 7; 
}

/**
 * r10 = counter
 */
int main(int argc, char** argv) {
    srand( time( 0 ) );
    printf( "Mastermind!\nGuess the 3 digit octal in 10 tries\n" );
    gRand();
    n1 = r0;
    gRand();
    n2 = r0;
    gRand();
    n3 = r0;
    printf( "Show number? (y/n)\n");
    inStr = new char[1]; //c++ bs
    scanf( "%1s", inStr );
    if( inStr[0] == y ) goto showNumber;
    //set loop counter
    r10 = 0;
    goto loop;
    loop:
    
    if( r10 > 10 )
    r10 = r10 + 1;
    
    
    showNumber:
    printf( "The number is %d%d%d\n", n1, n2, n3 );
    
   
    delete [] inStr; //c++ bs
    return 0;
}



