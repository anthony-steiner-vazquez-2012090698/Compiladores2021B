#include <stdio.h>
#include <stdlib.h>
#include <string.h>
void consumir(char, char*, int*);
void B(char*, int*);
void A(char*, int*);
int main(void){
    char entrada[8];
    puts("Cadena: ");
    scanf("%s", entrada);
    int *ptr;
    int g = 0;
    ptr = &g;
    A(entrada, ptr);
    if(entrada[*ptr]=='\0'){
        printf("La cadena %s pertence al L(G).\n", entrada);
    }
    return 0;
}
/* A -> aBa, B-> bAb, B->a */
void A(char* in, int *i){
    consumir('a', in, i);
    B(in, i);
    consumir('a', in, i);
}
void B(char* in, int *i){
    switch (in[*i]){
    case 'b':
        consumir('b', in, i);
        A(in, i);
        consumir('b', in, i);
        break;
    case 'a':
        consumir('a', in, i);
        break;
    default:
        exit(1);
    }
}
void consumir(char d, char* in, int *i){
    if(in[*i]== d){
        (*i)++;
    }else{
        exit(1);
    }
}