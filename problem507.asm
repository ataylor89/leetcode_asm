        global start
        extern _printf
        section .text
start:
        xor rax, rax
        xor rbx, rbx
        xor r9, r9
L:
        inc rbx
        cmp rbx, 14
        jg print
        xor rdx, rdx
        mov rax, 28
        div rbx
        cmp rdx, 0
        jnz L
        add r9, rbx
        jmp L
print:
        sub rsp, 8
        mov rdi, message
        mov rsi, 28
        mov rdx, r9
        call _printf
        mov rax, 0x02000001
        xor rdi, rdi
        syscall

        section .data
message:    db  "The sum of the divisors of %d is %d", 10, 0

