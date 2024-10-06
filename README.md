# Decoding `lea` Instructions

# Decoding Arithmetic Expressions from Assembly Code

## Overview

The goal of this assignment is to practice the mapping between C code and assembly, 
for arithmetic expressions that use the `lea` command. You can easily convert C code 
into assembly using the `gcc`. Here, you will need to read and understand assembly code 
that implements functions that perform arithmetic calculations, where the compiler takes
advantage of the arithmetic patterns of the `lea` command and simplifies the calculation
by using it. Your goal is to create C code that generates **identical assembly!**

You will create a C code file that contains nothing other than a function
definition. **While not required, you _may_** create an additional main program code
file so that you can make sample calls to the function to check how it works.


### Rubric

* Overall (1 pt)
    - The `lea_decode.c` file contains one function definitions, no include statements, no main
    function; it does include a descriptive comment at the top with your name in it.

* `deconde` (9 pts)
    - Correct function name and correct number and type of input parameters
    - Correct return value
    - Correct translation of assembly code:
        - Is not a line-by-line translation of the lines of assembly code
        - Performs reasonable condensing of assembly into fewer C lines
        - Uses temporary variables like `t0`, `t1`, to hold intermediate values

### Starter Files

* `lea_decode_correct.s`
    - This file contains your target assembly code. Reading through it, you will see
    that it contains code for a single function with multiple calls to the `lea`
    instruction.     Your task is to create C code that generates this **exact** assembly code.
* `Makefile`
    - This makefile contains targets for generating assembly code in `lea_decode.s`
    for a C code file `lea_decode.c`, and it also has a special target `compare`, which
    will compare `lea_decode_correct.s` to `lea_decode.s` and report any differences. You
    can use this to check whether your C code is generating the correct assembly.

### Execution

As always, the graders should be able to build, check, and clean your code:

```
make clean
make
make compare
```

The last command should, ideally, print **nothing**!

### Checking your work

The `make compare` command can only be used after you have created `lea_decode.c` and
run `make` to generat `lea_decode.s`. At that point, running `make compare` will
do a character-by-character comparison of `lea_decode.s` and the provided file
`lea_decode_correct.s`.

This runs a unix command called `diff` that can compare 2 files. If your `lea_decode.c`
code is _completely correct_, then when you run `make compare` you will see
the following (nothing printed after `make` prints the command itself):
```
$ make compare
diff -b -B -I '.ident*' -I '.file*' lea_decode.s lea_decode_correct.s
```

When there are differences between `lea_decode.s` and `lea_decode_correct.s`, you may get
something like this:
```
diff -b -B -I '.file*' -I '.ident*' lea_decode.s lea_decode_correct.s
8,9c8,12
<       endbr64
<       movl    $0, %eax
---
>       leaq    (%rsi,%rsi,8), %rdx
>       leaq    0(,%rdx,4), %rax
>       leaq    (%rdi,%rdi,8), %rcx
>       leaq    0(,%rcx,8), %rdx
>       subq    %rdx, %rax
```	

Interpreting what is printed above: It is comparing lines 8 and 9 from `lea_decode.s` with
lines 8 through 12 from `lea_decode_correct.s`. The lines with a `<` in front of 
them come from your file, and the lines with a `>` in front of them are lines from 
the correct assembly file.

The `diff` command can be quite clever, and can often detect extra inserted lines
or missing lines. To learn more about what it does, either type `man diff` in
the terminal, or do a web search for the `diff` Unix command.


## Tasks to Complete

### Task 1: Understand the assembly code in `lea_decode_correct.s`

- Make a copy of the `lea_decode_correct.s` file under a different name. This is so
that you can add notes and comments to the copy, without changing the original file.

- Determine the number and type of input parameters to the function, and the
type of the return value. For input parameters: look for registers that are **used** without
first being given a value.
- For each line, determine the effect of the line, tracking data moving around, and write the result in normal arithmetic
- Remember that `lea` here is being used not for memory address or pointer values, but
just as an efficient way to do arithmetic that can fit into the memory access arithmetic
formats!
You will create a C code file that contains nothing other than three function 
definitions. **While not required, you _may_** create an additional main program code
file so that you can make sample calls to the three functions to check what they do.


### Rubric

* Overall (1 pt)
    - The `arith.c` file contains three function definitions, no include statements, no main
    function; it does include a descriptive comment at the top with your name in it.

* `arith1` (10 pts)
    - Correct function name and correct number and type of input parameters
    - Correct return value
    - Correct translation of assembly code:
        - Is not a line-by-line translation of the lines of assembly code
        - Performs reasonable condensing of assembly into fewer C lines
        - Uses temporary variables like `t0`, `t1`, to hold intermediate values

* `arith2` (9 pts)
    - Correct function name and correct number and type of input parameters
    - Correct return value
    - Correct translation of assembly code:
        - Is not a line-by-line translation of the lines of assembly code
        - Performs reasonable condensing of assembly into fewer C lines
        - Uses temporary variables like `t0`, `t1`, to hold intermediate values

* `arith3` (8 pts)
    - Correct function name and correct number and type of input parameters
    - Correct return value
    - Correct translation of assembly code:
        - Is not a line-by-line translation of the lines of assembly code
        - Performs reasonable condensing of assembly into fewer C lines
        - Uses temporary variables like `t0`, `t1`, to hold intermediate values

### Starter Files

* `arith_complete.s`
    - This file contains your target assembly code. Reading through it, you will see
    that it contains code for three functions, `arith1`, `arith2`, and `arith3`.
    Your task is to create C code that generates this **exact** assembly code.
* `Makefile`
    - This makefile contains targets for generating assembly code in `arith.s`
    for a C code file `arith.c`, and it also has a special target `compare`, which
    will compare `arith_complete.s` to `arith.s` and report any differences. You
    can use this to check whether your C code is generating the correct assembly.

### Execution

As always, the graders should be able to build, check, and clean your code:

```
make clean
make
make compare
```

The last command should, ideally, print **nothing**!

### Checking your work

The `make compare` command can only be used after you have created `arith.c` and
run `make` to generat `arith.s`. At that point, running `make compare` will
do a character-by-character comparison of `arith.s` and the provided `arith_complete.s`
file.

This runs a unix command called `diff` that can compare 2 files. If your `arith.c`
code is _completely correct_, then when you run `make compare` you will see
the following (nothing printed after `make` prints the command itself):
```
$ make compare
diff -b -B -I '.ident*' -I '.file*' arith.s arith_complete.s
```

When there are differences between `arith.s` and `arith_complete.s`, you may get
something like this:
```
diff -I '.ident*' arith.s arith_complete.s
14c14
<       addl    %rdi, %rdx
---
>       addq    %rdi, %rdx
make: *** [compare] Error 1
```	

Interpreting what is printed above: It is comparing line 14 from both files. The
line with a `<` in front of it comes from your `arith.s` file, and the line with
a `>` in front of it is the corresponding line from `arith_complete.s`. It is
noting the difference between these lines.

The `diff` command can be quite clever, and can often detect extra inserted lines
or missing lines. To learn more about what it does, either type `man diff` in
the terminal, or do a web search for the `diff` Unix command.

When a whole function is still missing as you work, you will see something like
this example:

```
diff -b -B -I '.ident*' -I '.file*' arith.s arith_complete.s
29a30,44
>       .globl  arith3
>       .type   arith3, @function
> arith3:
> .LFB2:
>       .cfi_startproc
>       movzbl  %dil, %edi
>       movzbl  %sil, %eax
>       addl    %edi, %eax
>       movl    %eax, %edi
>       sall    $7, %edi
>       addl    %edi, %eax
>       ret
>       .cfi_endproc
> .LFE2:
>       .size   arith3, .-arith3
make: *** [compare] Error 1
```

This is showing that there are a set of lines in `arith_complete.s` that have
no corresponding lines in your file.


## Tasks to Complete

### Task 1: Understand the assembly code in `arith_complete.s`

- Make a copy of the `arith_complete.s` file under a different name. This is so
that you can add notes and comments to the copy, without changing the original 
`arith_complete.s` file.

- Work in stages on one function at a time:
    - Determine the number and type of input parameters to each function, and the type
of the return value. For input parameters: look for registers that are **used** without
first being given a value.
    - For each line, determine the effect of the line, tracking data moving around, and write the result in normal arithmetic
    - Multiple lines here may form a single expression in the C code

**Hints:**
- The `lea` commands here are being used to calculate ordinary arithmetic, 
particularly to avoid using the more expensive multiplication operator. The compiler
is taking advantage of the existence of `lea` to stretch its purpose beyond pointers
or memory accesses.
- The `mov` command is sometimes used to keep a copy of a variable for use later.
- Registers may be reused over the course of a function to hold different values. This
is even true of those used initially to hold input parameter values. And sometimes
a register that **could** be used for an input is instead just being used to hold
intermediate values. Read carefully!

### Task 2: Write the C function

- Create the C function, making sure to use the correct type and number of input
parameters and the correct return type
- Look at the steps in the assembly language, and determine a condensed number of steps
for your C code
    - Sometimes the assembly code may cast between types (seen as a combination of different
    register sizes in a single instruction). Use **explicit casting** in your C code
    when this happens.
    - Reducing the C code to a single line can cause problems: use intermediate variables
    where they are sensible
    - Be prepared to try different ways to condense the code if needed
    - Use reasonable variable names and good coding style throughout!


