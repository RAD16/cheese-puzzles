/*	Solve for greatest difference of two-values in 
	an array, left-to-right only, e.i. buying a stock
	for the greatest profit.
*/

#include <stdio.h>

int day(int tab[], size_t size) {
	int profit = 0;
	int n = 0;

	while (n < size) {
		int j = n + 1;
		int highnum = 0;

		while (j < size) {
			int diff = tab[j] - tab[n];
			highnum = (diff > highnum) ? diff : highnum;
			j++;
		}
		profit = (highnum > profit) ? highnum : profit;
		n++; 
	}
	return profit; 
}

int tab1[] = { 7, 1, 5, 3, 6, 4 }; 
int tab2[] = { 7, 6, 4, 3, 1 };
int tab3[] = { 3, 1, 10, 6, 4 };
int tab4[] = { 1, 3 };
int tab5[] = { 37, 29, 11, 60, 51, 59, 103, 39, 41, 6, 24, 87 };
int poop1[] = { 6 };
int poop2[] = { };

int
main(){
	printf("Best profit for Table 1: %d \n", day(tab1, sizeof(tab1)/sizeof(tab1[0]))); 
	printf("Best profit for Table 2: %d \n", day(tab2, sizeof(tab2)/sizeof(tab2[0])));
	printf("Best profit for Table 3: %d \n", day(tab3, sizeof(tab3)/sizeof(tab3[0])));
	printf("Best profit for Table 4: %d \n", day(tab4, sizeof(tab4)/sizeof(tab4[0])));
	printf("Best profit for Table 5: %d \n", day(tab5, sizeof(tab5)/sizeof(tab5[0])));
	printf("Best profit for Poop 1: %d \n", day(poop1, sizeof(poop1)/sizeof(poop1[0])));
	printf("Best profit for Poop 2: %d \n", day(poop2, sizeof(poop2)/sizeof(poop2[0])));
}
