section .data
    const10:    dd 10
    
section .bss
    input1 resd 1 ;
    num1 resd 1 ;
    num2 resd 1 ;
    num3 resd 1 ;

section .text
    global _start
    _start:
        mov eax , [esp+8]
        
        xor edx, edx
        mov esi, eax
        xor ebx, ebx

    convert_to_int1:
        mov bl, [esi]
        cmp bl, 0 
        je v2   
        sub bl, 48           
        imul edx, 10         
        add edx, ebx         
        inc esi              
        jmp convert_to_int1   


    v2:
        xor edi,edi
        mov edi, edx
        
        mov ebx , [esp+12]
        
        xor edx, edx
        mov esi, ebx
        xor ebx, ebx

    convert_to_int2:
        mov bl, [esi]
        cmp bl, 0 
        je addition
        sub bl, 48 
        imul edx, 10 
        add edx, ebx 
        inc esi
        jmp convert_to_int2

    addition:

        
        add edx, edi
        mov eax, edx
        
        
        xor ebx,ebx
        xor ecx,ecx
        xor edx,edx
        xor esi,esi
        xor edi,edi
        
    printNumber:
        xor edx,edx
        div dword [const10]
        
        cmp eax, 10
        jge greater_than_10
        jl less_than_10

    greater_than_10:
        add edx, 48
        mov [num3], edx
        jmp next

    less_than_10:
        cmp eax, 0
        je printReste
        add edx, 48
        mov [num2], edx
        jmp next
        
    next:    
        cmp eax, 0
        je printReste
        jmp printNumber
        
        ;si eax =/ 0 --> Print edx
        ;sinon jump printReste
        

    printReste:
        add edx, 48
        mov [num1], edx
        
        xor eax, eax
        mov eax, 4
        mov ebx, 1
        mov ecx, num1
        mov edx, 1
        int 0x80
        
        mov eax, 4
        mov ebx, 1
        mov ecx, num2
        mov edx, 1
        int 0x80
        
        mov eax, 4
        mov ebx, 1
        mov ecx, num3
        mov edx, 1
        int 0x80
        
        
        mov eax, 1 ; syscall pour terminer le programme
        xor ebx, ebx
        int 0x80