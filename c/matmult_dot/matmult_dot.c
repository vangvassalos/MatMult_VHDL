#include <stdio.h>
#include <stdlib.h>

#define M_SIZE 3

int* mem_alloc(int*** arr, int n);
void mem_dealloc(int*** arr, int* arr_data);

int main(int argc, const char *argv[])
{
    // Create the Arrays
    int **A;
    int **B;
    int **C;
    int i, j, k, sum=0;

    int *A_DATA = mem_alloc(&A, M_SIZE);
    int *B_DATA = mem_alloc(&B, M_SIZE);
    int *C_DATA = mem_alloc(&C, M_SIZE);

    if(!A || !B || !C){
        fprintf(stderr, "Arrays Not Allocated");
        exit(EXIT_FAILURE);
    }

    // Populate the Arrays
    for (i = 0; i < M_SIZE; i++){
        for (j = 0; j < M_SIZE; j++){
            A[i][j] = i*M_SIZE + j;
            B[i][j] = i*M_SIZE + j;
        }
    }
    // Calculate C
    for (i = 0; i < M_SIZE; i++) {
        for (j = 0; j < M_SIZE; j++) {
            sum = 0;
            for (k = 0; k < M_SIZE; k++) {
                sum += A[i][k] * B[k][j];
            }
            C[i][j] = sum;
        }
    }

    // Print A
    printf("A =\n");
    for (i = 0; i < M_SIZE; i++){
        for (j = 0; j < M_SIZE; j++){
            printf("%d\t", A[i][j]);
        }
        printf("\n");
    }

    // Print B
    printf("\nB =\n");
    for (i = 0; i < M_SIZE; i++){
        for (j = 0; j < M_SIZE; j++){
            printf("%d\t", B[i][j]);
        }
        printf("\n");
    }
    // Print C
    printf("\nC =\n");
    for (i = 0; i < M_SIZE; i++){
        for (j = 0; j < M_SIZE; j++){
            printf("%d\t", C[i][j]);
        }
        printf("\n");
    }

    mem_dealloc(&A, A_DATA);
    mem_dealloc(&B, B_DATA);
    mem_dealloc(&C, C_DATA);

    exit(EXIT_SUCCESS);
}

int* mem_alloc(int*** arr, int n) {
    *arr = (int**)malloc(n * sizeof(int*));
    int *arr_data = (int *) malloc( n * n * sizeof(int));
    for(int i=0; i<n; i++)
        (*arr)[i] = arr_data + i * n ;
    return arr_data; //free point
}

void mem_dealloc(int*** arr, int* arr_data) {
    free(arr_data);
    free(*arr);
}
