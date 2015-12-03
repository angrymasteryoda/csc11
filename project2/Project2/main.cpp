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
    r1 = rand();
    r0 = r1 % 7; 
}

    /*
     r0 = n1
     r1 = n2
     r2 = n3
     r3 = u1
     r4 = u2
     r5 = u3 
     */
void check(){
    r6 = 0; //did we win
    r7 = 0; //right place
    r8 = 0; //correct number
    //check n1
    if( r3 == r0 ) {
        r7++; 
        goto checkn2;
    }
    if( r3 == r1 ) r8++;
    if( r3 == r2 ) r8++;
    checkn2:
    //check n2
    if( r4 == r1 ) {
        r7++;
        goto checkn3;
    }
    if( r4 == r0 ) r8++;
    if( r4 == r2 ) r8++;
    //check n3
    checkn3:
    if( r5 == r2 ) { 
        r7++;
        goto output;
    }
    if( r5 == r1 ) r8++;
    if( r5 == r0 ) r8++;
    output:
    if( r7 == 3 ){
        r6 = 1;
    }
    printf( "%d digit(s) are correct and in the right place\n", r7 );
    printf( "%d digit(s) are correct\n", r8 );
}

/**
 * r10 = counter
 */
int main(int argc, char** argv) {
    srand( time( 0 ) );
    inStr = new char[1]; //c++ bs
    printf( "Mastermind!\nGuess the 3 digit octal in 10 tries\n" );
    gameLoop:
    gRand();
    n1 = r0;
    gRand();
    n2 = r0;
    gRand();
    n3 = r0;
    printf( "Show number? (y/n)\n");
    scanf( "%1s", inStr );
    if( inStr[0] == y ) goto showNumber;
    //set loop counter
    startLoop:
    r10 = 0;
    goto loop;
    loop:
    printf( "Enter a 3 digit number separated with spaces\n" );
    scanf( "%d %d %d", &r3, &r4, &r5 );
    r0 = n1;
    r1 = n2;
    r2 = n3;
    check(); // if r6 == 1 we won
    if( r6 == 1 ) goto win;
    if( r10 >= 10 ) goto lose;
    r10 = r10 + 1;
    goto loop;
    showNumber:
    printf( "The number is %d%d%d\n", n1, n2, n3 );
    goto startLoop;
    win:
    printf( "You won!\n" );
    r10 = r10 + 1;
    printf( "It took %d guesses\n", r10 );
    goto end;
    lose:
    printf( "You lost the correct number was %d%d%d\n", n1, n2, n3 );
    goto end;
    end:
    printf( "Play again? (y/n)\n");
    scanf( "%1s", inStr );
    if( inStr[0] == y ) goto gameLoop;
    delete [] inStr; //c++ bs
    return 0;
}
