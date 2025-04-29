#include<stdio.h> 

#define NUM_STUDENTS	45

int factorial(int x) {
	if (x == 0 || x == 1) {
		return 1;
	}

	return x * factorial(x - 1);

}


int main() {

	char fname[64];
	char lname[64];
	int age;
	int num;


	printf("Hello world!\n");

	printf("Enter name: ");

	scanf_s("%s %s", fname, (unsigned int)sizeof(fname), lname, (unsigned int)sizeof(lname));

	printf("Your name is:  %s %s", fname, lname);

	printf("\nEnter your age:");

	scanf_s("%d ", &age);

	printf("Your age is: %d\n", age);

	printf("Enter number for factorial: ");

	scanf_s("%d", &num);

	printf("The factorial of  %d is %d\n", num, factorial(num));

	char* name_ptr = fname;

	for (int i = 0; i < sizeof(fname); i++) {
		if (*name_ptr == '\0') {
			break;
		}
		printf("%c", *name_ptr);
		name_ptr++;
	}
	
}

