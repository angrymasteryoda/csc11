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
float s0, s1, s2, s3, s4, s5, s6, s7, s8, s9, s10, s11, s12, s13, s14, s15, s16, s17, s18, s19, s20, s21, s22, s23, s24, s25, s26, s27, s28, s29, s30, s31;
double d0, d1, d2, d3, d4, d5, d6, d7, d8, d9, d10, d11, d12, d13, d14, d15;

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
	printf( "\ninput number of years 1-20\n");
	scanf( "%d", &r11);		//where is your validation //validation is for chumps if you can't enter data right you cant run it
	int years = r11;
	printf( "\ninput number of interest rate 5-10\n");
	scanf( "%d", &r11);	//still missing validation //see above comment response
	int rate = r11;
	printf( "\ninput present value 1000-5000\n");
	scanf( "%d", &r11);
	int presnt = r11;
	float arr[20];
	
	for( int i = 1; i <= years; i++ ){
		s8 = rate;
		s8 = s8 / 100;
		s8 = s8 + 1;
		s10 = 1;
		//get the power of this
		for( int j = 0; j < i; j++ ){
			cout << "j = " << j << endl;
			s10 = s10 * s8;
		}
		cout << endl;
		s12 = presnt;
		s0 = s12 * s10;
		arr[i-1] = s0; //cout << i << " = "<< s0 << endl;
	}
	
	for( int i = 0; i < years; i++ ){
		cout << i+1 << " = "<< arr[i] << endl;
	}
	
	
	/*
	float present = r11;
	float fv = 0;
	for( int i = 1; i <= years; i++ ){
		fv = ( present * pow( ( 1 + rate ), i) );
		cout << "Year " << i << ": $" << fv << endl;
	}*/
}

int main(int argc, char** argv) {
	
	p2();
	cout << "\n\n\n";
	int a = 2;
	int x = 3;
	int t = 1;
	for (int i=0; i<x; i++){
		t *= a;
	}
	cout << "The answer is: " << t << endl;;
	return 0;
}

