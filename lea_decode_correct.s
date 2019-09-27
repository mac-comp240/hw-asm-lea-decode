	.file	"lea_decode.c"
	.text
	.globl	decode
	.type	decode, @function
decode:
.LFB0:
	.cfi_startproc
	leaq	(%rsi,%rsi,8), %rax
	movq	%rdi, %rdx
	salq	$4, %rdx
	negq	%rdx
	addq	%rdi, %rdx
	addq	%rdx, %rax
	ret
	.cfi_endproc
.LFE0:
	.size	decode, .-decode
	.ident	"GCC: (Ubuntu 4.8.4-2ubuntu1~14.04.3) 4.8.4"
	.section	.note.GNU-stack,"",@progbits
