; Affiche 1337 et retourne 0 si il reçoit 42 en entrée sinon 1

section .bss
    input RESB 3 ; reserver 3 Bytes
    len EQU $-input ; longueur de input
section .data
    message db '1337', 10 ; initialisation 
    chiffre db '42', 10

section .text
    global _start
    _start:

        mov eax, 3 ;syscall read
        mov ebx, 0 ; file descriptor 0 = stdin
        mov ecx, input ; destination
        mov edx, len ; longueur
        int 0x80


        mov esi, chiffre
        mov edi, input
        xor edx, edx
        LOOP:
            mov al, [esi + edx]
            mov bl, [edi + edx]
            inc edx
            cmp al, bl ; comparaison de char
            jne not_equal
            cmp bl, 10 ; fin de la chaine ?
            je equal42
            jmp LOOP

        equal42:
            mov ebx, 1 ; 1 = sortie standard (stdout)
            mov ecx, message ; message à afficher
            mov eax, 4 ;  4 = fonction write
            mov edx, 4 + 1 ; longueur du message 4 charctere de '1337' 
            int 0x80
            mov eax, 1
            mov ebx, 0
            int 0x80

        not_equal:
            mov eax, 1
            mov ebx, 1
            int 0x80
