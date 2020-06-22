#include <stdio.h> 
#include <stdlib.h> 

typedef struct ListNode {
	int val; 
	struct ListNode *next; 
} node_t; 

void 
print_list(node_t *head) {
	node_t *tmp = head;
	while(tmp != NULL) {
		printf("%d -> ", tmp->val);
		tmp = tmp->next;
	}
	printf("\n");
}

node_t 
*prepend_node(node_t **head, int val) {
	node_t *new = malloc(sizeof(node_t));

	new->val = val;
	new->next = *head; 
	*head = new; 

	return new; 
}

void
append_node(node_t *head, int val) {
	node_t *new = malloc(sizeof(node_t));

	while(head) {
		if (head->next == NULL) {
			new->val = val;
			new->next = NULL;
			head->next = new;
			head = NULL;
		} else head = head->next;
	}
}

// MERGE/SORT TWO LISTS
node_t 
*merge_two_lists(node_t *l1, node_t *l2) {
	node_t *head = (l1->val <= l2->val) ? l1 : l2;
	node_t *tail = (l1->val <= l2->val) ? l2 : l1;

	node_t *res = head; 
	node_t *tmp = NULL;
	 
	while(head) {
		if(tail == NULL) {
			head = head->next;
		} else if(head->next == NULL) {
			head->next = tail;
			head = (tail->next == NULL) ? NULL : head->next;
			tail = NULL;
		} else if(head->next->val <= tail->val) {
			head = head->next; 
		} else {
			tmp = head->next;
			head->next = tail; 
			head = head->next;
			tail = tmp;
		}
	}
	return res;
}

void
set_nodes(node_t **L1, node_t **L2) {
	*L1 = NULL; 
	*L2 = NULL; 

	// Initialize list 1
	prepend_node(L1, 12);
	prepend_node(L1, 9);
	prepend_node(L1, 4);
	prepend_node(L1, 3);
	prepend_node(L1, 1);
	prepend_node(L1, 0);
	
	// Initialize list 2
	prepend_node(L2, 2);
	prepend_node(L2, 2);
	prepend_node(L2, 2);
	prepend_node(L2, 2);
	prepend_node(L2, 2);
	prepend_node(L2, 1);
}
int
main() {
	node_t *L1, *L2; 
	set_nodes(&L1, &L2);

	printf("List 1: ");
	print_list(L1);

	printf("List 2: ");
	print_list(L2);

	printf("Merge (L1, L2)\n");
	print_list(merge_two_lists(L1, L2));

	// reset lists
	set_nodes(&L1, &L2);

	printf(">> Merge (L2, L1)\n");
	print_list(merge_two_lists(L2, L1));

}

