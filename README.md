# Decoding `lea` Instructions

For this assignment, you are given an assembly code file, and you must work
backwards from the assembly code to create the corresponding C source file.

Compiler writers often rely on the `leaq` instruction for different types of
math, as they allow computers to avoid using the more computationally expensive
multiplication operator.

This problem is similar to but slightly more complicated than those found in
section 3.5.1 of your text.

## Problem Definition

File you will create: `lea_decode.c`

Your code should compile using the provided Makefile.

If your C source code is correct, the pertinent portion of the file called
`lea_decode.s` will look like this:

```Assembly
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
```

The complete correct assembly file is in the file lea_decode_correct.s. You can
use the Makefile to create lea_decode.s once you have created an lea_decode.c
with code in it.

## Expectations for Code

This example is very simple, so the only thing that you need to do is comment your code file with a header that contains your name.

No extensive testing needed here--just devise the C code that compiles to the above assembly.

## Important Notes

The function called *decode* that created the above assembly has **2
parameters**. The register `%rdx` is being used in this code as a temporary
place to store values needed for the computation.

There are no shift operators in the original code.

*You cannot directly translate line by line into the C code* from the assembly
code for most of this example. Try to think about how some of the assembly could
be combined into compact expressions in C, using only arithmetic operations and
constants. Though your answer can contain a few lines of code, it is possible to
create a correct function that contains only one line of code in its code block
(within the {}).

Doing the following will check the difference between 2 files:

    diff -I '*.ident' lea_decode.s lea_decode_correct.s

Do this on the terminal to find out more:

    man diff

The makefile has this built into it, so that you can do this after you have done a `make`:

    make compare
	
When you have everything correct, you will get nothing returned when you type
the above `make compare` command. If there are errors, you will see output that
attempts to tell you where the files are different. Lines with a < in front of
them are from your file and lines with a > in front of them are corresponding
lines in the correct complete version. The graders will use this to verify the
correctness of your solution.
