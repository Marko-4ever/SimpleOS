section .asm

global idt_load
global idt_zero
extern idt_zero_handler

idt_load:
    push ebp
    mov ebp, esp

    mov ebx, [ebp+8]
    lidt [ebx]

    pop ebp
    ret

idt_zero:
    pusha
    call idt_zero_handler
    popa
    iretd