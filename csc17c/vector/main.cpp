/* 
 * File:   main.cpp
 * Author: Michael
 *
 * Created on September 24, 2015, 2:14 PM
 */

#include <cstdlib>
#include <iostream>

#include "Vector.h"

using namespace std;

/*
 * 
 */
int main( int argc, char** argv ) {
    Vector vec;
    vec.push( 0 );
    vec.push( 1 );
    cout << vec.toString();
    vec.pop_back();
    cout << vec.toString();
    
    return 0;
}

