.data
diviseur:
.int 2

.text
.globl racine_carree_entiere

racine_carree_entiere:

push %ebp
mov %esp,%ebp
push %ebx

setup:
movl 8(%ebp),   %eax    # a
cmp $0, %eax
jz bye

movl 12(%ebp),  %ecx    # N
cmp $0, %ecx
jz bye

movl %eax,      %ebx    # xn
                        # x0 = a
jmp iter

iter_setup:
movl 8(%ebp),   %eax

iter:
xorl %edx, %edx # pour division
divl %ebx
addl %eax, %ebx
shr $1, %ebx

check:
subl $1, %ecx
jnz iter_setup

bye:
pop %ebx
pop %ebp
ret
