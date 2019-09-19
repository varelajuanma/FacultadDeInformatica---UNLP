          .data
        infrapeso:   .double 18.5
        normal:      .double 25
        sobrepeso:   .double 30
        obeso:       .double 30
        peso:        .double 85
        altura:      .double 1.89
        IMC:         .word 0
               
          .code
        l.d f1, infrapeso(r0)
        l.d f2, normal(r0)
        l.d f3, sobrepeso(r0)
        l.d f4, obeso(r0)
        l.d f5, peso(r0)
        l.d f6, altura(r0)
        jal IMC
        halt

IMC:    mul.d f7, f6, f6
        div.d f8, f5, f7
        c.lt.d f1, f8
        bc1f infrap
        c.lt.d f2, f8
        bc1f normal
        c.lt.d f3, f8
        bc1f sobrep
        c.lt.d f4, f8
        bc1f obeso
        daddi r1, r0, 4
        sd r1, IMC(r0)
        j fin
infrap: daddi r1, r0, 1
        sd r1, IMC(r0)
        j fin
normal: daddi r1, r0, 2
        sd r1, IMC(r0)
        j fin
sobrep: daddi r1, r0, 3
        sd r1, IMC(r0)
        j fin
obeso:  daddi r1, r0, 4
        sd r1, IMC(r0)
fin:    jr r31