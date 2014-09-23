	.syntax unified
	.arch armv7-a
	.text
	.align 2
	.thumb
	.thumb_func

	.global non_recursive_fib
	.type non_recursive_fib, function

non_recursive_fib:
	push {r3, r4, r5, r6, lr}
	@ previous = -1
	mov r3, #-1
	@ result = 1
	mov r4, #1
	@ i = 0
	mov r5, #0
	@ sum = 0
	mov r6, #0
.L5:
	@ sum = result + previous
	add r6, r4, r3
	@ previous = result
	mov r3, r4
	@ result = sum
	mov r4, r6
	@ i = i + 1
	add r5, r5, #1
	@ if ( i <= x ) loop .L5
	cmp r5, r0
	ble .L5	

	@ return result
	mov r0, r4
	pop {r3, r4, r5, r6, pc}		@EPILOG

	@ END CODE MODIFICATION

	.size non_recursive_fib, .-non_recursive_fib
	.end
