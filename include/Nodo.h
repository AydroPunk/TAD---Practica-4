#ifndef __NODO_H__
#define __NODO_H__
#include <stdbool.h>

typedef struct _Nodo Nodo;

struct _Nodo{
    char *dato;
    struct Nodo *sig;
};

Nodo* crear_nodo(char*);
bool borrar_nodo(Nodo*);
Nodo* actualizar_nodo(Nodo*, char*);

#endif //__NODO_H__
