section .bss
    input RESB 4

section .data

section .text
    global _start
    _start :
        mov eax,3; 3 = read
        mov ebx,0; stdin
	mov ecx, input
	mov edx, 4;Longueur Maximal saisie
	int 0x80 ;0x80 est une fonction
	xor edx, edx
	mov esi, input
    
    conversion : 
	
	mov bl, [esi] ;stockage sasi utilisateur dans bl
	cmp bl, 0 ;on compare a 0 pour savoir si on a finit
	je test ; jump a test si oui
	cmp bx, 0x0A ;comparaison de si il y a un 0x0A (saut de ligne)
	je test; si oui Jump a test
	
	sub bl, 48 ;Table ASCII caractere -> nombre
	imul edx, 10 ; 
	add edx, ebx ;
	inc esi ; caractere suivant (se lit dans l'autre sens en ASM)
	jmp conversion ;Répète en jumpant au debut de la boucle
      
    test:
	
	mov eax, edx; eax prend la valeur de edx
	xor edx, edx; edx est initialisé a 0
        mov ebx, 2; ebx prend 2
	idiv ebx; divise eax par ebx le reste sera dans edx
	cmp edx, 0; si le reste = a 0 alors
	je pair; jump a pair
	xor edx, edx
	mov eax, 1; sinon eax = 1 writting
	mov ebx, 1; ebx = 1
	int 0x80; renvoi 1

    pair : 
	mov eax, 1; eax = 1 writting
	mov ebx, 0; ebx = 0
	int 0x80; renvoi 0
