#include <stdlib.h>
#include <string.h>
#include <stdio.h>
#include "Nodo.h"

Nodo* crear_nodo (char *d){
    Nodo *nodo = (Nodo*)malloc (sizeof(Nodo));
    nodo -> dato = d;
    nodo -> sig = NULL;
    return nodo;
}
bool borrar_nodo (Nodo* n){
    if (n != NULL){
        free (n);
        return true;
    }
    return false;
}
Nodo* actualizar_nodo (Nodo* n, char *d){
    Nodo* nuevo = realloc(n, *d);
    nuevo -> dato = d;
    nuevo -> sig = NULL;
    return nuevo;
}
