#pragma once

typedef struct node {
	void* data;
	struct node* prev;
	struct node* next;
}Ll_node;

typedef struct llist {
	Ll_node* head;
	Ll_node* tail;
}Llist;

Llist* createLlist();
void Lladd(Llist* list, void* data);