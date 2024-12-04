#include <stdio.h>
#include <stdlib.h>
struct Node {
    int data;
    struct Node* left;
    struct Node* right;
};

struct Node* createNode(int data) {
    struct Node* newNode = (struct Node*)malloc(sizeof(struct Node));
    if (!newNode) {
        printf("Memory error\n");
        return NULL;
    }
    newNode->data = data;
    newNode->left = newNode->right = NULL;
    return newNode;
}

struct Node* insert(struct Node* root, int data) {
    // If the tree is empty, create a new node
    if (root == NULL) {
        return createNode(data);
    }

    if (data < root->data) {
        root->left = insert(root->left, data);
    } else if (data > root->data) {
        root->right = insert(root->right, data);
    }

    // Return the (unchanged) node pointer
    return root;
}


void inorder(struct Node* root) {
    if (root != NULL) {
        inorder(root->left);  // Visit left subtree
        printf("%d ", root->data);  // Print the node's data
        inorder(root->right);  // Visit right subtree
    }
}

void preorder(struct Node* root) {
    if (root != NULL) {
        printf("%d ", root->data);  // Print the node's data
        preorder(root->left);  // Visit left subtree
        preorder(root->right);  // Visit right subtree
    }
}


void postorder(struct Node* root) {
    if (root != NULL) {
        postorder(root->left);  // Visit left subtree
        postorder(root->right);  // Visit right subtree
        printf("%d ", root->data);  // Print the node's data
    }
}


struct Node* search(struct Node* root, int key) {

    if (root == NULL || root->data == key)
        return root;


    if (key > root->data)
        return search(root->right, key);


    return search(root->left, key);
}


int main() {
    struct Node* root = NULL;
    int data, choice;

    while (1) {
        printf("\nBinary Search Tree Operations:\n");
        printf("1. Insert a node\n");
        printf("2. In-order traversal\n");
        printf("3. Pre-order traversal\n");
        printf("4. Post-order traversal\n");
        printf("5. Search for a node\n");
        printf("6. Exit\n");
        printf("Enter your choice: ");
        scanf("%d", &choice);

        switch (choice) {
            case 1:
                printf("Enter the value to insert: ");
                scanf("%d", &data);
                root = insert(root, data);
                printf("Node inserted: %d\n", data);
                break;
            case 2:
                printf("In-order traversal of the tree: ");
                inorder(root);
                printf("\n");
                break;
            case 3:
                printf("Pre-order traversal of the tree: ");
                preorder(root);
                printf("\n");
                break;
            case 4:
                printf("Post-order traversal of the tree: ");
                postorder(root);
                printf("\n");
                break;
            case 5:
                printf("Enter the value to search: ");
                scanf("%d", &data);
                struct Node* foundNode = search(root, data);
                if (foundNode != NULL) {
                    printf("Node with value %d found.\n", foundNode->data);
                } else {
                    printf("Node with value %d not found.\n", data);
                }
                break;
            case 6:
                printf("Exiting...\n");
                exit(0);
            default:
                printf("Invalid choice, please try again.\n");
        }
    }

    return 0;
}
