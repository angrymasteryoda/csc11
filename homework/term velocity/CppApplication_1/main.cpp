#include <iostream>

using namespace std;

int pow(int x, int n) {
    int m;
    if (n == 0) return 1;
    if ( n % 2 == 0 ) {
        m = pow(x, n / 2);
        return m * m;
    } else return x * pow(x, n - 1);
} 


int sqrt( int num ){
    // int x = num * 10eprecision // ??? is this posible
    int x = 6 * pow( 10, 2 );
    int n = 0;
    while( true ){
        n = ( x + ( num / x ) ) / 2;
        if( n == x ){ break; }
        x = n;
    }
    return x;
}

float sqrt( float num, int precision ){
//    int x = num * 10e precision
    float x = precision * 100;
    float n = 0;
    while( true ){
        n = ( x + ( num / x ) ) / 2;
        if( n == x ){ break; }
        x = n;
    }
    return x;
}
float sqrt( float num ){ return sqrt( num, 6 );}

int main(){
    cout << sqrt( 654321 ) << endl;
    cout << sqrt( 654321.0f, 10 ) << endl;
    /*float wt = .10125;
    float density = 2.3679e-3;
    float cd = 0.5;
    float d = .14;

    float pi = 3.1415926;

    float result = ( 8 * wt ) / ( pi * density * cd * d * d );

    result = sqrt( result );

    cout<< result;
    */


    return 0;
}

/*
.10125*16=1.62
1.62*16=9.92
.92*16=14.72
.72*16=11.52
.52*16=8.32
0x19db85

wd 24 bp -24 wt
8 = 8
-----

3243f6a bp -24 wd 28 pi
009b2e bp-24 density
8 bp-1 cd
23D70a bp-24 d

*/