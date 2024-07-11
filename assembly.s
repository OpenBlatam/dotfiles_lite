section .data
    hello db 'Hello, World!',0   ; null-terminated string to be printed

section .text
    global _start

_start:
    ; write syscall
    mov eax, 4           ; syscall number for sys_write
    mov ebx, 1           ; file descriptor 1 is stdout
    mov ecx, hello       ; pointer to message to write
    mov edx, 13          ; length of message string
    int 0x80             ; call kernel

    ; exit syscall
    mov eax, 1           ; syscall number for sys_exit
    xor ebx, ebx         ; exit code
    int 0x80             ; call kernel
