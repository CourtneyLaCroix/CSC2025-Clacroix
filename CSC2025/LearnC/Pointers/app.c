#include <stdio.h>
#include "app.h"

#define ARR_SIZE		5


typedef struct circle {
	int diameter;
	char* color;

} Circle;


int main() {

	//int num = 0;

	//int num1 = add1(&num);

	//add2(&num);

	//printf("Number is %d ", num);


	//int nums[] = {1, 2, 3, 4, 5};

	//print_array(nums);


	Circle* circ1;

	init_circle(&circ1);


}

void init_circle(Circle* cir_in) {
	cir_in -> diameter = 5;
	(*cir_in).color = "red";

}

int add1(int arg) {
	return arg + 1;
}

void add2(int* arg) {
	*arg = *arg + 2;
	return;
}

void print_array(int input[]) {
	for (int i = 0; i < ARR_SIZE; i++) {
		printf("%d", input[i]);
	}
}