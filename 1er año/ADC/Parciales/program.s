.data
INICIO: .word 14,8,21,11,5,19,2,4,10,32,1,0,16,3,9,12,22
MINIMO: .word 100
FINAL:  .word 0

.code
ld r1, MINIMO(r0)
dadd r2, r0, r0
dadd r4, r0, r0
loop: ld r3, INICIO(r2)
dadd r4, r4, r3
daddi r2, r2, 8
slt r5, r4, r1
beqz r3, supero
j loop
supero: sd r3, FINAL(r0)
halt
