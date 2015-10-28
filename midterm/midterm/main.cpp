/* 
 * File:   main.cpp
 * Author: Michael
 *
 * Created on October 26, 2015, 11:19 AM
 */

#include <cstdlib>
#include <string>
#include <cstdio>
#include <iostream>
#include <stdio.h>
#include <string.h>

using namespace std;

void printn(int);
/**
Develop an application that will determine the gross pay for 
employees. The company pays "straight-time" for the 
first 40 hours worked, double time for all hours worked in 
excess of 40 hours but less than 50 hours, and triple time for any 
hours worked over 50 hours. Inputs to the program would be hours
worked and rate of pay all of which are integers.  
Output would be gross pay.
Note:  60 hours maximum per week, so hours<=60
 */
void problem1(){
//    r0 = "input hours, payrate: "
    cout << "input hours and payrate: (hours, payrate) ";
//    r0 = "%d"
    int r1 = 60; //hours
    int r2 = 9; //payrate
    int r3 = 0; //result
    //scanf( "%d, %d", r1, r2 );
    if( r1 <= 40 )
        r3 = r2 * r1;
    else if ( r1 > 40 && r1 < 50 ){
        r3 = r2 * 40 + ( ( r1 - 40 ) * ( r2 * 2) );
//        r3 = r2 * 40;
    }
    else if ( r1 >= 50 && r1 <= 60 )
        //r3 = r2 * 40 + ( ( 50 - 40 ) * 2 * r2 ) + (( r1 - 50 ) * 3 * r2);
    printf( "you made: %d", r3 );
    
    
}
void problem2(){
    //after scanf you will get a newline. you make need to use getchar to get a single character
//    char* a = new char[1];
//    char* b = new char[1];
//    a[0] = 'a';
//    b[0] = 'a';
//    int r = strcmp( a, b );
//    cout << r << endl;
//    delete [] a;
//    delete [] b;
    
    cout << "input the Internet plan\n";
    char in = getchar();
    int hrs;
    int p;
    cin >> hrs;
    
    if ( in == 'a' ){
        if ( hrs <= 11 ) {
            p = hrs*30;
            goto _print;
        }
    }
    
    _print:
    cout << "'" << in << "'" << endl;
    
}
void problem3(){
    //r0 = "input:%d";
    int r1 = 6;
    scanf( "%d", &r1 );
    if( r1 <= 1 ){
        printn( r1 );
    }
    
    int r2 = 1; //fibo
    int r3 = 1; //fiboPrevious
    int r4 = 2; //counter
    
    for( ; r4 < r1; ++r4 ){
        int r5 = r2; //temp
        r2 += r3;
        r3 = r5;
    }
    printn( r2 );
    /*
    
    int n = 6;
    if(n <= 1){
        return n;
    }
    int fibo = 1;
    int fiboPrev = 1;
    for(int i = 2; i < n; ++i){
     int temp = fibo;
     fibo += fiboPrev;
     fiboPrev = temp;
    }
    return fibo;
    */
}

void printn( int n ){
    printf( "%d", n );
}

int main( int argc, char** argv ) {
    problem2();
    return 0;
}

