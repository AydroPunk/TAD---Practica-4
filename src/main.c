#include <stdio.h>
#include "Nodo.h"
#include <stdlib.h>

int main()
{
	Nodo *A, *B;
	char *d = 'aloh';
	char *c = 'soida';
	bool a;

	A = crear_nodo(&d);
	printf ("Contenido en el nodo %s\n", A -> dato);

	A = actualizar_nodo (A,&c);
	printf ("Contenido del nodo: %s\n",A -> dato);

	a = borrar_nodo(A);
	if (a == true){
		printf ("Se borro el nodo\n");
	}else{
		printf ("No se logro borrar el nodo\n");
	}
	return 0;
	
	char * ptr = (char *) calloc (10, 10); // asigna 100 bytes de espacio de memoria

}