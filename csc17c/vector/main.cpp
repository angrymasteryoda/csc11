/* 
 * File:   main.cpp
 * Author: Michael
 *
 * Created on September 24, 2015, 2:14 PM
 */

#include <cstdlib>
#include <iostream>
#include <string>

#include "Vector.h"

using namespace std;

/*
 * 
 */
int main( int argc, char** argv ) {
    Vector<string> vec;
    vec.push( "test" );
    vec.push( "delete" );
    cout << vec.toString();
    vec.pop_back();
    cout << vec.toString();
    
    return 0;
}

