#include <stdio.h>
#include <stdlib.h>

#define M_SIZE 3

int main()
{
    // Create the Vectors
    int A[M_SIZE];
    int B[M_SIZE];
    int C=0; int i;

    // Populate the Arrays
    for (i = 0; i < M_SIZE; i++){
        A[i] = i*M_SIZE;
        B[i] = i*M_SIZE;
    }
    // Calculate C
    for (i = 0; i < M_SIZE; i++) {
        C += (A[i] * B[i]);

   }

    // Print C
    for (i = 0; i < M_SIZE; i++)
        printf("A[%d] = %d, B[%d] = %d\n", i, A[i], i, B[i]);


    printf("\nC = A[i]xB[i] = %d\n", C);
    exit(EXIT_SUCCESS);
}
