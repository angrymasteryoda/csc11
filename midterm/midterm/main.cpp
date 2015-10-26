/* 
 * File:   main.cpp
 * Author: Michael
 *
 * Created on October 26, 2015, 11:19 AM
 */

#include <cstdlib>
#include <string>
#include <cstdio>

using namespace std;

void printn(int);
void problem3(){
    //r0 = "input:%d";
    int r1 = 6;
    scanf( "input: %d", &r1 );
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
    problem3();
    return 0;
}

