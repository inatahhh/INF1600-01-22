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
mov length, %ecx # Charger longueur de string1 dans %ecx

cld # Balayage vers l'avant (DF = 0)
cmp length1, length2
jne mots_differents # Si les longeurs different, aller a cette etiquette
comparaison : 

loop_comparaison:
lodsb # Charger le caractere de string1 dans AL
cmpb $0, %al # Verifier si fin de chaine
je fin

# Convertir en minuscule
cmp $'A',%al # Verifier si la lettre est en majuscule
jl pas_conversion # Si n'est pas majuscule
cmp $'Z', %al
jg pas_conversion
add $32, %al # Convertir les majuscules en minuscules

pas_conversion:
scasb 
# Comparer les caracteres
jne mots_differents # Aller mots_differents si pas le meme
loop loop_comparaison # Repeter la boucle si meme caracteres

mots_identiques:
mov $1, %eax # Mettre 1 dans %eax pour egalite
jmp fin

mots_differents:
mov $0, %eax # Mettre 0 dans %eax pour montrer difference

fin:
mov %ebp, %esp
pop %ebp
ret