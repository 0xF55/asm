; day 10 learning asm
; Works For MASM Only
; x64 Calling Convention

.code

ASMstrlen proc
	xor rax,rax

countloop:
	cmp byte ptr [rcx],0
	jz exit
	inc rax
	inc rcx
	jmp countloop

exit:
	ret

ASMstrlen endp

ASMstrcpy proc
	xor rax,rax
	xor rbx,rbx

strloop:
	mov bl,byte ptr [rdx]
	mov byte ptr [rcx],bl
	cmp bl,0
	jz exit
	inc rcx
	inc rdx
	jmp strloop

exit:
	ret

ASMstrcpy endp



ASMstrcat proc

findnull:
	mov al,byte ptr [rcx]
	inc rcx
	cmp al,0
	jnz findnull
	dec rcx
	jmp cat

cat:
	mov al,byte ptr [rdx]
	mov byte ptr [rcx],al
	cmp al,0
	jz exit
	inc rcx
	inc rdx
	jmp cat

exit:
	xor rax,rax
	ret

ASMstrcat endp


ASMmemcpy proc

	xor rax,rax

	mov rsi,rdx
	mov rdi,rcx
	mov rcx,r8
	rep movsb

exit:
	xor rax,rax
	ret

ASMmemcpy endp




end

