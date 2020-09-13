	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 10, 15	sdk_version 10, 15, 4
	.section	__TEXT,__literal8,8byte_literals
	.p2align	3               ## -- Begin function main
LCPI0_0:
	.quad	4517329193108106637     ## double 9.9999999999999995E-7
	.section	__TEXT,__text,regular,pure_instructions
	.globl	_main
	.p2align	4, 0x90
_main:                                  ## @main
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$32, %rsp
	leaq	-16(%rbp), %rdi
	leaq	-32(%rbp), %rsi
	callq	_gettimeofday
	cvtsi2sdl	-8(%rbp), %xmm0
	mulsd	LCPI0_0(%rip), %xmm0
	cvtsi2sdq	-16(%rbp), %xmm1
	addsd	%xmm0, %xmm1
	movsd	%xmm1, -24(%rbp)        ## 8-byte Spill
	leaq	-16(%rbp), %rdi
	leaq	-32(%rbp), %rsi
	callq	_gettimeofday
	xorps	%xmm1, %xmm1
	cvtsi2sdq	-16(%rbp), %xmm1
	xorps	%xmm0, %xmm0
	cvtsi2sdl	-8(%rbp), %xmm0
	mulsd	LCPI0_0(%rip), %xmm0
	addsd	%xmm1, %xmm0
	subsd	-24(%rbp), %xmm0        ## 8-byte Folded Reload
	leaq	L_.str(%rip), %rdi
	movb	$1, %al
	callq	_printf
	xorl	%eax, %eax
	addq	$32, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.section	__TEXT,__literal8,8byte_literals
	.p2align	3               ## -- Begin function mysecond
LCPI1_0:
	.quad	4517329193108106637     ## double 9.9999999999999995E-7
	.section	__TEXT,__text,regular,pure_instructions
	.globl	_mysecond
	.p2align	4, 0x90
_mysecond:                              ## @mysecond
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$32, %rsp
	leaq	-16(%rbp), %rdi
	leaq	-24(%rbp), %rsi
	callq	_gettimeofday
	cvtsi2sdq	-16(%rbp), %xmm1
	cvtsi2sdl	-8(%rbp), %xmm0
	mulsd	LCPI1_0(%rip), %xmm0
	addsd	%xmm1, %xmm0
	addq	$32, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.section	__TEXT,__cstring,cstring_literals
L_.str:                                 ## @.str
	.asciz	"Execution time: %11.8f s\n"


.subsections_via_symbols
