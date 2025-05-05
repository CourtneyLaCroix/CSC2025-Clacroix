#include <stdio.h>
#include <stdlib.h>
#include "LinkedList.h"



Llist* createLlist() {
	Llist* list = malloc(sizeof(list));
	list->head = NULL;
	list->tail = NULL;
	return list;
}

void Lladd(Llist* list, void* data) {
	Ll_node* node = malloc(sizeof(Ll_node));
	node->data = data;
	node->next = NULL;
	node->prev = NULL;


	if (list->head != NULL) {
		list->tail->next = node;
		node->prev = list->tail;
		list->tail = node;
	}
	else {
		list->head = node;
		list->tail = node;
	}

}