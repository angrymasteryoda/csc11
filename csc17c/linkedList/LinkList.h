/* 
 * File:   LinkList.h
 * Author: rcc
 *
 * Created on September 24, 2015, 11:13 AM
 */

#ifndef LINKLIST_H
#define	LINKLIST_H

#include <string>
using namespace std;

class LinkList {
public:
    LinkList( int data );
    LinkList(const LinkList& orig);
    virtual ~LinkList();
    void append( int );
    void prepend( int );
    string toString();
    string toStringr();
    void empty();
    void remove( int );
    void test();
private:
    struct Node {
        int data;
        Node *next;
        Node *prev;
    };
    Node *head;
    Node *worker;

};

#endif	/* LINKLIST_H */

