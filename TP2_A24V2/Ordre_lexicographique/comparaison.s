.data
string1:
.ascii "test"
length1:
.int 4
string2:
.ascii "test1" # Si vous voulez tester l'égalité, mettez la string la plus longue dans string2
                # La longeur doit etre la meme
                # Les characteres sont les memes [ASCII] (0x61 à 0x7a minuscule) et (0x41 à 0x5a majuscules)
length2:
.int 5

.text
.globl comparaison

main : 
push ebp
mov ebp, esp
sub esp, 4

lea string1, %esi # l'addresse de string1 est mis dans le registre %esi
lea string2, %edi # l'addresse de string2 est mis dans le registre %edi
mov ecx, length1

comparaison : 

cmps # Compare la valeur de la chaine en memoire d'adresse %esi avec la valeur de la chaine en memoire d'adresse %edi

ret
push %eax





