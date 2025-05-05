
#include <stdio.h>
#include <stdlib.h>
#include "LinkedList.h"


typedef struct{
	int num;
}Integer;

int main() {
	Llist* list = createLlist();
	printf("List on the heap: %p", list);

	for (int i = 0; i < 3; i++) {
		Integer* num = malloc(sizeof(Integer));
		num->num = i;
		Lladd(list, num);
	}

	Ll_node* current = list->head;
	while(current != NULL){
		printf("%d ",((Integer*)current->data)->num);
		current = current->next;
	}


}