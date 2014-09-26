	.syntax unified
	.arch armv7-a
	.text

	.equ locked, 1
	.equ unlocked, 0

	.global lock_mutex
	.type lock_mutex, function
lock_mutex:
        @ INSERT CODE BELOW
        @ Load r1 as locked (#1)
        ldr r1, =locked
.L1:
        @ Read r0 to check mutex is locked
        ldrex r2, [r0]
        cmp r2, #0
        @ Lock it
        strexeq r2, r1, [r0]
        @ Check if strex successful
        cmp r2, #0
        @ if strexeq fail do lock again (back to L1)
        bne .L1
        @ END CODE INSERT
	bx lr

	.size lock_mutex, .-lock_mutex

	.global unlock_mutex
	.type unlock_mutex, function
unlock_mutex:
	@ INSERT CODE BELOW
        @ Load r1 as unlocked (#0)
        ldr r1, =unlocked
.L2:
        @ Read r0 to check mutex is unlocked
        ldrex r2, [r0]
        cmp r2, #1
        @ Unlock it
        strexeq r2, r1, [r0]
        @ Check if strex successful
        cmp r2, #0
        @ if strexeq fail do unlock again (back to L2)
        bne .L2
        @ END CODE INSERT
	bx lr
	.size unlock_mutex, .-unlock_mutex

	.end
