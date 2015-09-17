/* 
 * File:   main.cpp
 * Author: rcc
 *
 * Created on August 20, 2014, 2:45 PM
 */

#include <iostream>
#include <cstdlib>
#include <ctime>

using namespace std;
void builMaxheap( int*, int );
void maxHeapify( int*, int, int );\
void heapSort( int *, int );

void maxHeapify( int *a, int i, int len ){
    int j, temp;
    temp = a[i];
    j = 2 * i;
    while( j <= len ){
        if( j < len && a[j+1] > a[j] ){
            j = j + 1;
        }
        if( temp > a[j] ){
            break;
        } else if( temp <= a[j] ) {
            a[j/2] = a[j];
            j = 2 * j;
        }
    }
    a[j/2] = temp;
    return;
}

void heapSort( int *a, int len ){
    int i, temp;
    for( int i = len; i >= 2; i-- ){
        temp = a[i];
        a[i] = a[1];
        a[1] = temp;
        maxHeapify( a, 1, i - 1 );
    }
}


void buildMaxheap( int *a, int len ){
    int i;
    for( int i = len / 2; i >= 1; i-- ){
        maxHeapify( a, i, len );
    }
}

void fillArray(int a[],int n){
    for(int i=1;i<=n;i++){
        a[i]=rand();
    }
}

void printArray(int a[],int n,int perLine){
    cout<<endl;
    for(int i=1;i<=n;i++){
        cout<<a[i]<<" ";
        if(i%perLine==perLine-1)cout<<endl;
    }
    cout<<endl;
}

int main(int argc, char** argv) {
    srand( static_cast<unsigned int>( time(0) ) );
    
    const int SIZE = 1000000;
    int array[SIZE];
    fillArray( array, SIZE );
    
    int beg = time(0);
    buildMaxheap( array, SIZE );
    heapSort( array, SIZE);
    int end = time(0);
    
//    printArray( array, SIZE, 10 );
    cout<<"The array of size "<<SIZE<<" took "<<end-beg<<"(secs)"<<endl;

    
    return 0;
}
