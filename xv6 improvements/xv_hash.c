#include "user.h"
#include "defs.h"

#include "xv_hash.h"

static int BKDR(char* str) //calculate BKDR hash of a string
{
    int hashkey = 0;
    for(int i=0; str[i] != '\0'; i++)
    {
        hashkey = hashkey * 31 + str[i];
        hashkey = hashkey % HASH_LEN;
    }
    return hashkey;
}

struct Hashtable* Hashtable()
{
    struct Hashtable *t = (struct Hashtable*)malloc(sizeof(struct Hashtable));
    for(int i=0; i<HASH_LEN; i++)
    {
        t->table[i] = 0; //NULL
    }
    return t;
}

int find(struct Hashtable *t, char *str)
{
    int hashkey = BKDR(str);
    struct Hashnode *cur = t->table[hashkey];
    while(cur != 0)
    {
        if(strlen(cur->word) == strlen(str) &&
                strncmp(cur->word,str,strlen(str)) == 0)
            return 1;
        else
            cur = cur->next;
    }
    return 0;
}

void insert(struct Hashtable *t, char *str)
{
    if(find(t,str) == 1)
        return;
    int hashkey = BKDR(str);
    struct Hashnode **ppnode = &(t->table[hashkey]);
    while(ppnode != 0)
    {
        ppnode = &(ppnode->next);
    }
    *ppnode = (struct Hashnode*)malloc(sizeof(struct Hashnode));
    strncpy((*ppnode)->word,str,20);
    (*ppnode)->next = 0;
}

void delet(struct Hashtable *t, char *str)
{
    int hashkey = BKDR(str);
    struct Hashnode *cur = t->table[hashkey];
    if(strlen(cur->word) == strlen(str) &&
                strncmp(cur->word,str,strlen(str)) == 0)
    {
        t->table[hashkey] = cur->next;
        free(cur);
    }
    else
    {
        struct Hashnode *pre = cur;
        cur = cur->next;
        while(cur != 0)
        {
            if(strlen(cur->word) == strlen(str) &&
                    strncmp(cur->word,str,strlen(str)) == 0)
            {
                struct Hashnode *nex = cur->next;
                pre->next = nex;
                free(cur);
            }
            else
            {
                pre = cur;
                cur = cur->next;
            }     
        }
    }
}
