global _start

extern printf

section .data
    max: dq 1000
    format: db "answer: %d", 10

section .text
_start:
    mov rcx, 1 ; start with num 1
    xor rbx, rbx ; sum will be stored in $rbx

    mov rsi, 3
    mov rdi, 5

loop:
    ; check if divisible by 3
    mov rax, rcx
    xor rdx, rdx
    div rsi
    cmp edx, 0 ; check remainder
    je sum

    ; check if divisible by 5
    mov rax, rcx
    xor rdx, rdx
    div rdi
    cmp edx, 0 ; check remainder
    jne increment

sum:
    add rbx, rcx

increment:
    inc rcx
    cmp rcx, [max]
    jnz loop

exit:
    ; sum is stored in $rbx here
    mov rdi, format
    mov rsi, rbx
    mov al, 0
    call printf

    mov rdi, 0 ; exit code
    mov rax, 60 ; sys_exit
    syscall
