/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/* 
 * File:   main.cpp
 * Author: michael
 *
 * Created on December 9, 2015, 11:32 AM
 */
#include <stdio.h>
#include <iostream>
#include <cmath>
#include <cstdlib>

using namespace std;

/*
 * 
 */
int r0, r1, r2, r3, r4, r6, r7, r8, r9, r10, r11, r12;

int p3(){
	r2 = 0x12b0; //a 
	r3 = 0xe042; //b
	
	scanf( "%d", &r1 );
	
	r0 = r1 * r1;
	r0 = r0 * r2;
	
	r4 = r3 * r1;
	r0 = r0 + r4;
	r0 >>=16;
	printf( "out = %d\n", r0 );
	
}

void p2(){
	printf( "\ninput number of years 1-20: ");
	scanf( "%d", &r11); 
	int years = r11;
	printf( "\ninput number of interest rate 5-10: ");
	scanf( "%d", &r11);
	int rate = r11 / 100;
	printf( "\ninput present value 1000-5000: ");
	scanf( "%d", &r11);
	int present = r11;
	
	float result = present * pow( ( 1 + rate ), years );
	printf( "result: %f", result);
}
int main(int argc, char** argv) {
	
	p2();
	return 0;
}

