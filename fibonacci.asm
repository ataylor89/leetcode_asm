        global start
        global fibonacci
        extern _printf
        
        section .text
start:
        sub rsp, 8
        mov rdi, message
        mov rsi, 0
        mov rdx, 1
        call _printf
        mov rdi, message
        mov rsi, 1
        mov rdx, 1  
        call _printf
        add rsp, 8
        xor rax, rax
        xor rbx, rbx
        xor rcx, rcx
        xor r9, r9
        mov rax, 1
        mov rbx, 1
        mov r9, 2
fib:
        cmp r9, 10
        je print
        mov rcx, rax
        add rcx, rbx
        mov rdi, message
        mov rsi, r9
        mov rdx, rcx
        push rax
        push rbx
        push rcx
        push r9
        sub rsp, 8
        call _printf
        add rsp, 8
        pop r9
        pop rcx
        pop rbx
        pop rax
        mov rax, rbx
        mov rbx, rcx
        inc r9
        jmp fib
print:
        sub rsp, 8
        mov rdi, printmessage
        mov rsi, r9
        call _printf
        add rsp, 8
        mov rax, 0x02000001
        xor rdi, rdi
        syscall

        section .data
message:        db      "F(%d) = %d", 10, 0
printmessage:   db      "Printed the first %d fibonacci numbers", 10, 0       
        
