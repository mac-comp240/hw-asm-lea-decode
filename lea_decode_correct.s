	.file	"lea_decode.c"
	.text
	.globl	decode
	.type	decode, @function
decode:
.LFB0:
	.cfi_startproc
	movq	%rsi, %rdx
	salq	$4, %rdx
	subq	%rsi, %rdx
	leaq	0(,%rdx,4), %rax
	leaq	0(,%rdi,8), %rdx
	subq	%rdx, %rdi
	addq	%rdi, %rax
	ret
	.cfi_endproc
.LFE0:
	.size	decode, .-decode
	.ident	"GCC: (GNU) 8.3.1 20190311 (Red Hat 8.3.1-3)"
	.section	.note.GNU-stack,"",@progbits
