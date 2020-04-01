        .file   "lea_decode.c"
        .text
        .globl  decode
        .type   decode, @function
decode:
.LFB0:
        .cfi_startproc
        leaq    0(,%rsi,8), %rdx
        subq    %rsi, %rdx
        leaq    0(,%rdx,8), %rax
        leaq    0(,%rdi,4), %rdx
        subq    %rdx, %rdi
        salq    $4, %rdi
        addq    %rdi, %rax
        ret
        .cfi_endproc
.LFE0:
        .size   decode, .-decode
        .ident  "GCC: (GNU) 8.3.1 20190311 (Red Hat 8.3.1-3)"
        .section        .note.GNU-stack,"",@progbits
