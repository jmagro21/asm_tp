section .data
    message db '1337', 10section .data
    message db '1337', 0

global _start
 
section .text
_start:
    mov eax, 4 ; code pour l'appel système write
    mov ebx, 1 ; file descriptor stdout
    mov ecx, message ; pointeur vers le message
    mov edx, 4 ; longueur du message
    int 0x80 ; appel système write

    xor eax, 0 ; met eax à 0
    ret ; retourne le contenu de eax, qui est 0


global _start
 
section .text
_start:
    mov eax, 4 ; code pour l'appel système write
    mov ebx, 1 ; file descriptor stdout
    mov ecx, message ; pointeur vers le message
    mov edx, 4 ; longueur du message
    int 0x80 ; appel système write

    xor eax, eax ; met eax à 0
    ret ; retourne le contenu de eax, qui est 0
