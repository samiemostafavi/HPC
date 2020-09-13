	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 10, 15	sdk_version 10, 15, 4
	.section	__TEXT,__literal8,8byte_literals
	.p2align	3               ## -- Begin function main
LCPI0_0:
	.quad	4517329193108106637     ## double 9.9999999999999995E-7
LCPI0_1:
	.quad	4636737291354636288     ## double 100
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
	movl	$120064, %eax           ## imm = 0x1D500
	callq	____chkstk_darwin
	subq	%rax, %rsp
	movq	___stack_chk_guard@GOTPCREL(%rip), %rax
	movq	(%rax), %rax
	movq	%rax, -8(%rbp)
	leaq	L_.memset_pattern(%rip), %rsi
	leaq	-40016(%rbp), %rdi
	movl	$40000, %edx            ## imm = 0x9C40
	callq	_memset_pattern16
	leaq	L_.memset_pattern.1(%rip), %rsi
	leaq	-80016(%rbp), %rdi
	movl	$40000, %edx            ## imm = 0x9C40
	callq	_memset_pattern16
	movl	$6, %eax
	.p2align	4, 0x90
LBB0_1:                                 ## =>This Inner Loop Header: Depth=1
	movapd	-40064(%rbp,%rax,8), %xmm0
	movapd	-40048(%rbp,%rax,8), %xmm1
	movapd	-40032(%rbp,%rax,8), %xmm2
	movapd	-40016(%rbp,%rax,8), %xmm3
	mulpd	-80064(%rbp,%rax,8), %xmm0
	mulpd	-80048(%rbp,%rax,8), %xmm1
	movapd	%xmm0, -120064(%rbp,%rax,8)
	movapd	%xmm1, -120048(%rbp,%rax,8)
	mulpd	-80032(%rbp,%rax,8), %xmm2
	mulpd	-80016(%rbp,%rax,8), %xmm3
	movapd	%xmm2, -120032(%rbp,%rax,8)
	movapd	%xmm3, -120016(%rbp,%rax,8)
	addq	$8, %rax
	cmpq	$5006, %rax             ## imm = 0x138E
	jne	LBB0_1
## %bb.2:
	xorpd	%xmm0, %xmm0
	movl	$7, %eax
	.p2align	4, 0x90
LBB0_3:                                 ## =>This Inner Loop Header: Depth=1
	addsd	-120072(%rbp,%rax,8), %xmm0
	addsd	-120064(%rbp,%rax,8), %xmm0
	addsd	-120056(%rbp,%rax,8), %xmm0
	addsd	-120048(%rbp,%rax,8), %xmm0
	addsd	-120040(%rbp,%rax,8), %xmm0
	addsd	-120032(%rbp,%rax,8), %xmm0
	addsd	-120024(%rbp,%rax,8), %xmm0
	addsd	-120016(%rbp,%rax,8), %xmm0
	addq	$8, %rax
	cmpq	$5007, %rax             ## imm = 0x138F
	jne	LBB0_3
## %bb.4:
	movsd	%xmm0, -120048(%rbp)    ## 8-byte Spill
	leaq	-120032(%rbp), %rdi
	leaq	-120056(%rbp), %rsi
	callq	_gettimeofday
	cvtsi2sdl	-120024(%rbp), %xmm4
	movq	-120032(%rbp), %rax
	mulsd	LCPI0_0(%rip), %xmm4
	xorl	%ecx, %ecx
	.p2align	4, 0x90
LBB0_5:                                 ## =>This Loop Header: Depth=1
                                        ##     Child Loop BB0_6 Depth 2
	movl	$6, %edx
	.p2align	4, 0x90
LBB0_6:                                 ##   Parent Loop BB0_5 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	movapd	-40064(%rbp,%rdx,8), %xmm0
	movapd	-40048(%rbp,%rdx,8), %xmm1
	movapd	-40032(%rbp,%rdx,8), %xmm2
	movapd	-40016(%rbp,%rdx,8), %xmm3
	mulpd	-80064(%rbp,%rdx,8), %xmm0
	mulpd	-80048(%rbp,%rdx,8), %xmm1
	movapd	%xmm0, -120064(%rbp,%rdx,8)
	movapd	%xmm1, -120048(%rbp,%rdx,8)
	mulpd	-80032(%rbp,%rdx,8), %xmm2
	mulpd	-80016(%rbp,%rdx,8), %xmm3
	movapd	%xmm2, -120032(%rbp,%rdx,8)
	movapd	%xmm3, -120016(%rbp,%rdx,8)
	addq	$8, %rdx
	cmpq	$5006, %rdx             ## imm = 0x138E
	jne	LBB0_6
## %bb.7:                               ##   in Loop: Header=BB0_5 Depth=1
	incl	%ecx
	cmpl	$100, %ecx
	jne	LBB0_5
## %bb.8:
	xorps	%xmm0, %xmm0
	cvtsi2sd	%rax, %xmm0
	addsd	%xmm0, %xmm4
	movsd	%xmm4, -120040(%rbp)    ## 8-byte Spill
	leaq	-120032(%rbp), %rdi
	leaq	-120056(%rbp), %rsi
	callq	_gettimeofday
	xorps	%xmm0, %xmm0
	cvtsi2sdl	-120024(%rbp), %xmm0
	movq	-120032(%rbp), %rax
	mulsd	LCPI0_0(%rip), %xmm0
	movl	$7, %ecx
	movsd	-120048(%rbp), %xmm1    ## 8-byte Reload
                                        ## xmm1 = mem[0],zero
	.p2align	4, 0x90
LBB0_9:                                 ## =>This Inner Loop Header: Depth=1
	addsd	-120072(%rbp,%rcx,8), %xmm1
	addsd	-120064(%rbp,%rcx,8), %xmm1
	addsd	-120056(%rbp,%rcx,8), %xmm1
	addsd	-120048(%rbp,%rcx,8), %xmm1
	addsd	-120040(%rbp,%rcx,8), %xmm1
	addsd	-120032(%rbp,%rcx,8), %xmm1
	addsd	-120024(%rbp,%rcx,8), %xmm1
	addsd	-120016(%rbp,%rcx,8), %xmm1
	addq	$8, %rcx
	cmpq	$5007, %rcx             ## imm = 0x138F
	jne	LBB0_9
## %bb.10:
	xorps	%xmm2, %xmm2
	cvtsi2sd	%rax, %xmm2
	addsd	%xmm2, %xmm0
	subsd	-120040(%rbp), %xmm0    ## 8-byte Folded Reload
	divsd	LCPI0_1(%rip), %xmm0
	leaq	L_.str(%rip), %rdi
	movb	$2, %al
	callq	_printf
	movq	___stack_chk_guard@GOTPCREL(%rip), %rax
	movq	(%rax), %rax
	cmpq	-8(%rbp), %rax
	jne	LBB0_12
## %bb.11:
	xorl	%eax, %eax
	addq	$120064, %rsp           ## imm = 0x1D500
	popq	%rbp
	retq
LBB0_12:
	callq	___stack_chk_fail
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
	.asciz	"Execution time: %11.8f s, dummy: %f\n"

	.section	__TEXT,__literal16,16byte_literals
	.p2align	4               ## @.memset_pattern
L_.memset_pattern:
	.quad	4631811479262199808     ## double 47
	.quad	4631811479262199808     ## double 47

	.p2align	4               ## @.memset_pattern.1
L_.memset_pattern.1:
	.quad	4614256447914709615     ## double 3.1415000000000002
	.quad	4614256447914709615     ## double 3.1415000000000002


.subsections_via_symbols
