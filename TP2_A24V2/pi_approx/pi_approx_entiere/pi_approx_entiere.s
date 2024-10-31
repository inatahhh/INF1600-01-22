.text
.globl pi_approx_entiere

pi_approx_entiere:

push %ebp
mov %esp,%ebp
push %ebx

# VOTRE CODE #
setup:
movl $0, %esi # Sum
movl 8(%ebp), %ecx # Iterations
cmp $0, %ecx
jz end
movl $1, %edi # Denominator
jmp a_div

a_den:
addl $2, %edi

a_div:
movl $0, %edx
movl $0x80000000, %eax # 1 << 31
div %edi
# n-ieme terme dans %eax

a:
addl %eax, %esi
subl $1, %ecx
jz shrink
# Fallthrough = on continue

s_den:
addl $2, %edi

s_div:
movl $0, %edx
movl $0x80000000, %eax
div %edi

s:
subl %eax, %esi
subl $1, %ecx
jnz a_den
# Fallthrough = fini


shrink:
shr $29, %esi
end:
movl %esi, %eax

pop %ebx
pop %ebp
ret
