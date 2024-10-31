.data
i:             
.float  0       # i
iteration:
.int 50         # Nombre d'itérations
x:
.float 2       
y:
.float 1
signe1:
.float 1
signe2:
.float -1
pi:             # Valeur du ratio de pi initial
.float 0
cte: 
.float 1
multiplicateur:
.float 4
.text
.globl pi_approx_flottante

pi_approx_flottante:

push %ebp       # Prologue
mov %esp,%ebp
push %ebx

#votre code
<<<<<<< HEAD
=======
setup:
flds pi     #  au fond de la pile
movl (iteration), %ecx
# movl 8(%ebp), %ecx # iterations
cmp $0, %ecx
jz end
jmp iter


iter_setup:
sgn:
flds signe2
flds signe1
fmulp
fstps signe1
# signe1_new *= -1

d:
flds x
flds y
faddp
fstps y
# y += 2

iter:
flds y
flds signe1
fdivp
faddp
# pi += signe1 / y

check:
subl $1, %ecx
jnz iter_setup


end:
flds multiplicateur
fmulp
# fois 4
>>>>>>> 5709fef54ced5f2382f3c6401d3d8da99db39279

pop %ebx
pop %ebp
ret
