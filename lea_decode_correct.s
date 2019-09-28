.file   "lea_decode.c"
        .text
        .globl  decode
        .type   decode, @function
decode:
.LFB0:
        .cfi_startproc
        leaq    (%rsi,%rsi,8), %rax
        movq    %rdi, %rdx
        salq    $4, %rdx
        subq    %rdx, %rdi
        addq    %rdi, %rax
        ret
        .cfi_endproc
.LFE0:
        .size   decode, .-decode
        .ident  "GCC: (Ubuntu 8.3.0-6ubuntu1) 8.3.0"
        .section        .note.GNU-stack,"",@progbits

