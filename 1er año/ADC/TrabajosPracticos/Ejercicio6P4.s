              .data
            A: .word 2
            B: .word 5
            C: .word 5
            D: .word 0

              .code
            ld r1, A(r0)
            ld r2, B(r0)
            ld r3, C(r0)
            bne r1, r2, noesigual
            daddi r4, r0, 1
noesigual:  bne r1, r3, noesigual2
            daddi r4, r4, 1
            j fin
noesigual2: bne r2, r3, fin
            daddi r4, r0, 1
fin:        beqz r4, loop
            daddi r4, r4, 1
loop:       sd r4, D(r0)
            halt