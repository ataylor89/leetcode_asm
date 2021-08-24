        global start
        extern _printf

        section .text
start:
        mov byte r13b, 10
        mov r8, 0
L:
        mov r9, r8
LL:
        inc r9
        mov r10, arr
        mov r11, arr
        add r10, r8
        add r11, r9
        mov byte r12b, [r10]
        add byte r12b, [r11]
        cmp r12b, r13b
        je sum
        cmp r8, 8
        je sum
        cmp r9, 9
        jl LL
        inc r8
        jmp L
sum:
        sub rsp, 8
        mov rdi, format
        mov rsi, 10
        mov rdx, r8
        mov rcx, r9
        call _printf
        mov rax, 0x02000001
        xor rdi, rdi
        syscall

        section .data
arr:
        db      0
        db      1
        db      2
        db      3
        db      4
        db      5
        db      6
        db      7
        db      8
        db      9
format: 
        db      "sum=%d i=%d j=%d", 10, 0
