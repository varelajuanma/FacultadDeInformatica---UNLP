            .data

   vector:   .word   4, 11, 7, 28, 15, 9
   mayor:    .word   10
   nuevo:    .word   0

 
            .code
           
            daddi  r8, r0, 1           ; para comparar
            dadd   r1, r0, r0
            ld     r3, mayor(r0)
            daddi  r4, r0, 6
            jal    Comparar
            halt


  Comparar: dadd   r2, r0, r0
  loop:     ld     r5, vector(r1)
            slt    r7, r3, r5   
            bne    r7, r8, Es_menor
            sd     r5, nuevo(r2)
            daddi  r2, r2, 8
  Es_menor: daddi  r1, r1, 8
            daddi  r4, r4, -1
            bnez   r4, loop
            jr     r31