.data
n:
.float 12        # valeur de n
iteration:
.int 10          # nombre d'iterations
x:
.float 12
adr_2:
.float 2

.text
.globl racine_carre_flottante

racine_carre_flottante:

push %ebp               # prologue
mov %esp,%ebp
push %ebx

setup:
flds n
movl (iteration), %ecx
cmp $0, %ecx
jz bye

iter_setup:
fld %st(0) # dupe xn

iter:
flds n
fdivp
faddp
flds adr_2
fdivrp

check:
subl $1, %ecx
jnz iter_setup

bye:
pop %ebx
pop %ebp
ret
