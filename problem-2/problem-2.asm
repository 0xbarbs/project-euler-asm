global _start

extern printf

section .data
    max: dq 4000000
    format: db "answer: %d", 0xa, 0x0

section .text
_start:
    ; rcx will be used to store our sum
    xor rcx, rcx

    ; start with 1 and 2
    mov rdi, 1 ; rdi will contain the lower num
    mov rsi, 2 ; rsi will contain the higher num

loop:
    ; check if greater than max
    cmp rsi, [max]
    jge exit

    ; check if divisible by 2 (even)
    xor rdx, rdx
    mov rax, rsi
    mov rbx, 2
    div rbx

    cmp rdx, 0
    jnz skip

    ; add rsi to our sum
    add rcx, rsi

skip:
    ; add rsi to rdi and switch
    xadd rsi, rdi
    jmp loop

exit:
    mov rdi, format
    mov rsi, rcx
    call printf

    mov rdi, 0
    mov rax, 60
    syscall

