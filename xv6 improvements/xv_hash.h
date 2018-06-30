#ifndef XV_HASH_H
#define XV_HASH_H

#define HASH_LEN 1000

struct Hashnode
{
    char word[21];
    struct Hashnode *next;
};

struct Hashtable
{
    struct Hashnode* table[HASH_LEN];
};

struct Hashtable* Hashtable(); //constructor
void insert(struct Hashtable *t, char *str);
void delet(struct Hashtable *t, char *str);
int find(struct Hashtable *t, char *str); //1 for found, 0 for unfound


#endif
