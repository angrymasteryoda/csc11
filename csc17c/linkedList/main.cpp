/* 
 * File:   main.cpp
 * Author: rcc
 *
 * Created on August 20, 2014, 2:45 PM
 */

#include <iostream>
using namespace std;

#include "LinkList.h"

int main(int argc, char** argv) {
    LinkList link( 0 );
    link.append( 1 );
    link.append( 2 );
    link.append( 3 );
    link.prepend( 4 );
    
    cout << link.toString();
    link.remove(2);
    cout << "remove 2\n";
    cout << link.toString();
    return 0;
}