/* 
 * File:   LinkList.cpp
 * Author: rcc
 * 
 * Created on September 24, 2015, 11:13 AM
 */

#include "LinkList.h"
#include <cstddef>
#include <sstream>
#include <iostream>
using namespace std;

LinkList::LinkList( int data ) {
    Node *node = new Node;
    node->data = data;
    node->next = NULL;
    node->prev = NULL;
    head = node;
    
}

LinkList::~LinkList() {
    if( head ) {
        do{
            worker = head;
            head = head->next;
            delete worker;
        } while( head );
    }
}

void LinkList::append( int data ){
    if( head ){
        Node *last;
        worker = head;
        while( worker = worker->next ){
            last = worker;
        }
        Node *node = new Node; 
        node->data = data;
        node->prev = last;
        last->next = node;
        node->next = NULL;
    } else{
        Node *node = new Node;
        node->data = data;
        node->next = NULL;
        node->prev = NULL;
        head = node;
    }
}

void LinkList::prepend( int data ){
    if( head ){
        worker = head; //set the head to the worker
        //make the new node 
        Node *node = new Node;
        node->data = data;
        node->prev = NULL;
        //set the old head to the new head's next
        node->next = worker;
        worker->prev = node;
        head = node;
    } else{
        Node *node = new Node;
        node->data = data;
        node->next = NULL;
        node->prev = NULL;
        head = node;
    }
}

string LinkList::toString(){
    if( head ) {
        worker = head;
        string outStr = "";
        do {
            outStr += "data element -> ";
            stringstream ss;
            string data;
            ss << worker->data;
            ss >> data;
            outStr += data;
            outStr += " \n";
        } while( worker = worker->next );
        return outStr;
    }
    return "";
}

string LinkList::toStringr(){
    if( head ){
        Node *last;
        worker = head;
        do{ 
            last = worker;
        } while( worker = worker->next );

        string outStr = "";
        do {
            outStr += "data element -> ";
            stringstream ss;
            string data;
            ss << last->data;
            ss >> data;
            outStr += data;
            outStr += "\n";
        } while( last = last->prev );
        return outStr;
    }
    return "";
}

void LinkList::empty(){
    if( head ) {
        do{
            worker = head;
            head = head->next;
            delete worker;
        } while( head );
    }
}

void LinkList::remove( int data ){
    if( head ){
        worker = head;
        do{
            if( worker->data == data ){
                break;
            }
        } while( worker = worker->next );
        
        (worker->prev)->next = (worker->next);
        (worker->next)->prev = (worker->prev);
        delete worker;
        worker = head;
    }
}

