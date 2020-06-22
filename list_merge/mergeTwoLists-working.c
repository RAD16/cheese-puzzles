#include <stdio.h> 
#include <stdlib.h> 

typedef struct ListNode {
	int val; 
	struct ListNode *next; 
} node_t; 

node_t *head = NULL; 
node_t *tail = NULL; 

void print_list(node_t *head) {
	node_t *tmp = head;
	while(tmp != NULL) {
		printf("%d -> ", tmp->val);
		tmp = tmp->next;
	}
	printf("\n");
}

node_t 
*create_node(int val) {
	node_t *new = malloc(sizeof(node_t));

	new->val = val;
	new->next = NULL;

	return new;
}

node_t 
*add_node_front(node_t **head, node_t *new) {
	new->next = *head; 
	*head = new; 
	return new; 
}

node_t 
*merge_two_lists(node_t *l1, node_t *l2) {
	node_t *t1 = l1;
	node_t *t2 = l2;

	while(t1 != NULL) {
		node_t *t1_old = t1->next; 
		node_t *t2_old = t2->next;

		t2->next = t1->next;
		t1->next = t2; 

		t1 = t1_old;
		t2 = t2_old;
	}
	return l1;
}

int
main() {
	node_t *L1 = NULL; 
	node_t *L2 = NULL; 

	// Initialize list 1
	add_node_front(&L1, create_node(4));
	add_node_front(&L1, create_node(2));
	add_node_front(&L1, create_node(1));
	
	// Initialize list 2
	add_node_front(&L2, create_node(4));
	add_node_front(&L2, create_node(3));
	add_node_front(&L2, create_node(1));

	printf("List 1:\n");
	print_list(L1);
	
	printf("List 2:\n");
	print_list(L2);

	printf("Merged?\n");
	print_list(merge_two_lists(L1, L2));
}

