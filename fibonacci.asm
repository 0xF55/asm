; this is my first asm project
; in this code every element in the array is 4bits
; Works For MASM Only
; x64 Calling Convention

.code                      

FIBASM proc
    mov r10, rcx           ; r10 = pointer to array
    mov r11, rdx           ; r11 = count

    xor ecx, ecx           ; a = 0
    mov edx, 1             ; b = 1
    xor r8d, r8d           ; c = 0

    ; arr[0] = a
    mov dword ptr [r10], ecx
    cmp r11, 1
    jbe exit

    ; arr[1] = b
    mov dword ptr [r10 + 4], edx

    ; adjust pointer to arr[2]
    add r10, 8
    sub r11, 2
    jz exit

loopfib:
    ; adding a,b to c
    mov r8d, ecx
    add r8d, edx

    
    mov dword ptr [r10], r8d ; moving c value to the array element
    add r10, 4 ; moving ptr to next element

    mov ecx, edx ; a = b
    mov edx, r8d ; b = c

    dec r11 ; decrement number of elements (for the loop)
    jnz loopfib

exit:
    ret
FIBASM endp

END
