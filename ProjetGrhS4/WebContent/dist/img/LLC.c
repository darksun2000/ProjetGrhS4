
#include <stdio.h>
#include <stdlib.h>

typedef struct {
	int value;
	struct Lentier* pointer;
}Lentier;

Lentier* List(int val)
{
	Lentier* tete = (Lentier*) malloc(sizeof(Lentier));
	tete->pointer = NULL;
	tete->value = val;
	return tete;
}

void ajouterList(Lentier* tete, int val)
{
	Lentier* p = tete;

	while(  p->pointer != NULL)
	{
		
		p = p->pointer;
	}

	Lentier* e = (Lentier*)malloc(sizeof(Lentier));
	e->value = val;
	e->pointer =p->pointer;
	p->pointer = e;
}




int taille(Lentier* tete)
{
	int i = 0;
	Lentier* p = tete;
	while(p!=NULL)
	{
		p = p->pointer;
		i++;
	}
	return i;
}


void suprimerTList(Lentier* tete)
{
	Lentier* p = tete;
	while(p!=NULL)
	{
		free(p);
		tete = tete->pointer;
		p = tete;
	}
}


int getelement(Lentier* tete, int i)
{
	Lentier* p = tete;
	int k ;
	for(k = 0; k<i && p->pointer != NULL; k++)
	{
		p = p->pointer;
	}
	return p->value;
}

void setelement(Lentier* tete, int val, int i)
{
	Lentier* p = tete;
	int k;
	for( k= 0; k<i && p->pointer != NULL; k++)
	{
		p = p->pointer;
	}
	p->value = val;
}




int main()
{   printf("donner la taille de la liste: ");
	int n;
	scanf("%i", &n);
	printf("donner le nombre dans l'index 1: ");
	int val;
	scanf("%d", &val);
	Lentier* tete = List(val);
	int i;
	for( i= 1; i<n; i++)
	{
		printf("donner le nombre dans l'index %d: ", (i+1));
		scanf("%d", &val);
		ajouterList(tete, val);
	}
	printf("\n---------- : Votre List est :------------\n");

	for(i= 0; i<n; i++)
	{
		printf("%d,\n", getelement(tete, i));
	}


	suprimerTList(tete);
	return 0;
}

