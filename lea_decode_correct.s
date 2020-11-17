	.file	"lea_decode.c"
	.text
	.globl	decode
	.type	decode, @function
decode:
.LFB0:
	.cfi_startproc
	leaq	(%rsi,%rsi,8), %rax
	leaq	(%rax,%rax,8), %rax
	leaq	(%rdi,%rdi,4), %rcx
	leaq	0(,%rcx,8), %rdx
	addq	%rdx, %rax
	ret
	.cfi_endproc
.LFE0:
	.size	decode, .-decode
	.ident	"GCC: (GNU) 8.3.1 20190311 (Red Hat 8.3.1-3)"
	.section	.note.GNU-stack,"",@progbits
