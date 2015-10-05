/* 
 * File:   Vector.h
 * Author: Michael
 *
 * Created on September 24, 2015, 2:15 PM
 */

#ifndef VECTOR_H
#define	VECTOR_H
#include <string>
#include <sstream>
using namespace std;

//template <class T>
template <typename T>
class Vector {
public:
    
    Vector( ) {
        allocSize = 0;
        head = NULL;
        worker = NULL;
    }

    virtual ~Vector( ) {
        if ( head ) {
            do {
                worker = head;
                head = head->next;
                delete worker;
            } while ( head );
        }
    }
    
    int push( T data ) {
        if ( head ) {
            Node *last;
            worker = head;
            do {
                last = worker;
            } while ( worker = worker->next );
            Node *node = new Node;
            node->data = data;
            node->prev = last;
            last->next = node;
            node->next = NULL;
            node->index = allocSize;
        } else {
            Node *node = new Node;
            node->data = data;
            node->next = NULL;
            node->prev = NULL;
            node->index = allocSize;
            head = node;
        }
        ++allocSize;
    }

    int pop_back( ) {
        if ( head ) {
            worker = head;
            do{
                if( worker->next == NULL ){
                    break;
                }
                worker = worker->next;
            } while( true );
        }
        
        (worker->prev)->next = NULL;
        allocSize--;
        delete worker;
    }

    void empty( ) {
        if ( head ) {
            do {
                worker = head;
                head = head->next;
                delete worker;
            } while ( head );
        }
        allocSize = 0;
    }

    //TODO work on this
    //    void remove( const int index ) {
    //        if ( head ) {
    //            worker = head;
    //            do {
    //                if ( worker->index == index ) {
    //                    break;
    //                }
    //            } while ( worker = worker->next );
    //
    //            ( worker->prev )->next = ( worker->next );
    //            ( worker->next )->prev = ( worker->prev );
    //            delete worker;
    //            worker = head;
    //        }
    //    }

    string toString( ) {
        if ( head ) {
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
            } while ( worker = worker->next );
            return outStr;
        }
        return "";
    }

    int size( ) {
        return allocSize + 1;
        ;
    }
private:
    int allocSize;

    struct Node {
        T data;
        Node *next;
        Node *prev;
        int index;
    };
    Node *head = NULL;
    Node *worker = NULL;
};

#endif	/* VECTOR_H */

