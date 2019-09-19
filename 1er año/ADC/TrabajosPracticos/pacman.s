		.data
colorN:		.byte	0,0,0,0
colorA:		.byte	255,255,0,0
coorX:		.byte	20
coorY:		.byte	20
DATA:		.word32	0x10008
CONTROL:	.word32	0x10000
uno:		.word	1
dos:		.word	2
tres:		.word	3
vec1:		.byte	1,1,1,1,1,1,2,2,2,2,2,2,2,1,1,1,1,1,1,0
vec2:		.byte	1,1,1,2,2,2,2,3,3,3,3,3,2,2,2,1,1,1,1,0
vec3:		.byte	1,1,1,2,3,3,3,3,3,3,3,3,3,3,3,2,2,2,1,0
vec4:		.byte	1,2,2,2,3,3,3,2,2,3,3,3,3,3,3,3,3,2,1,0
vec5:		.byte	1,2,3,3,3,3,3,2,2,3,3,3,3,3,3,3,3,3,2,0
vec6:		.byte	2,2,3,3,3,3,3,3,3,3,3,3,3,3,2,2,2,2,1,0
vec7:		.byte	2,3,3,3,3,3,3,3,3,3,3,2,2,2,2,1,1,1,1,0
vec8:		.byte	2,3,3,3,3,3,3,3,3,3,3,2,1,1,1,1,1,1,1,0
vec9:		.byte	2,3,3,3,3,3,3,3,2,2,2,2,1,1,1,1,1,1,1,0
vec10:		.byte	2,3,3,3,3,3,3,3,2,1,1,1,1,1,1,1,1,1,1,0
vec11:		.byte	2,3,3,3,3,3,3,3,2,2,2,2,1,1,1,1,1,1,1,0
vec12:		.byte	2,3,3,3,3,3,3,3,3,3,3,2,2,2,2,1,1,1,1,0
vec13:		.byte	2,3,3,3,3,3,3,3,3,3,3,3,3,3,2,2,2,2,1,0
vec14:		.byte	2,2,2,3,3,3,3,3,3,3,3,3,3,3,3,3,3,2,1,0
vec15:		.byte	1,1,2,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,2,0
vec16:		.byte	1,1,2,2,2,3,3,3,3,3,3,3,3,3,3,3,2,2,1,0
vec17:		.byte	1,1,1,1,2,3,3,3,3,3,3,3,3,3,2,2,2,1,1,0
vec18:		.byte	1,1,1,1,2,2,2,3,3,3,3,2,2,2,2,1,1,1,1,0
vec19:		.byte	1,1,1,1,1,1,2,2,2,2,2,2,1,1,1,1,1,1,1,0

		.code
		lwu	$s0, CONTROL($zero)
		lwu	$s1, DATA($zero)
		daddi $t0, $0, 7
		sd $t0, 0($s0)
		ld	$a0, uno($zero)
		ld	$a1, dos($zero)
		ld	$a2, tres($zero)
		lbu	$s3, coorY($zero)
		sb	$s3, 4($s1)
		daddi	$a3, $zero, vec19
		jal 	recorrer
		daddi	$s3, $s3, 1
		sb	$s3, 4($s1)
		daddi	$a3, $zero, vec18
		jal 	recorrer
		daddi	$s3, $s3, 1
		sb	$s3, 4($s1)
		daddi	$a3, $zero, vec17
		jal 	recorrer
		daddi	$s3, $s3, 1
		sb	$s3, 4($s1)
		daddi	$a3, $zero, vec16
		jal 	recorrer
		daddi	$s3, $s3, 1
		sb	$s3, 4($s1)
		daddi	$a3, $zero, vec15
		jal 	recorrer
		daddi	$s3, $s3, 1
		sb	$s3, 4($s1)
		daddi	$a3, $zero, vec14
		jal 	recorrer
		daddi	$s3, $s3, 1
		sb	$s3, 4($s1)
		daddi	$a3, $zero, vec13
		jal 	recorrer
		daddi	$s3, $s3, 1
		sb	$s3, 4($s1)
		daddi	$a3, $zero, vec12
		jal 	recorrer
		daddi	$s3, $s3, 1
		sb	$s3, 4($s1)
		daddi	$a3, $zero, vec11
		jal 	recorrer
		daddi	$s3, $s3, 1
		sb	$s3, 4($s1)
		daddi	$a3, $zero, vec10
		jal 	recorrer
		daddi	$s3, $s3, 1
		sb	$s3, 4($s1)
		daddi	$a3, $zero, vec9
		jal 	recorrer
		daddi	$s3, $s3, 1
		sb	$s3, 4($s1)
		daddi	$a3, $zero, vec8
		jal 	recorrer
		daddi	$s3, $s3, 1
		sb	$s3, 4($s1)
		daddi	$a3, $zero, vec7
		jal 	recorrer
		daddi	$s3, $s3, 1
		sb	$s3, 4($s1)
		daddi	$a3, $zero, vec6
		jal 	recorrer
		daddi	$s3, $s3, 1
		sb	$s3, 4($s1)
		daddi	$a3, $zero, vec5
		jal 	recorrer
		daddi	$s3, $s3, 1
		sb	$s3, 4($s1)
		daddi	$a3, $zero, vec4
		jal 	recorrer
		daddi	$s3, $s3, 1
		sb	$s3, 4($s1)
		daddi	$a3, $zero, vec3
		jal 	recorrer
		daddi	$s3, $s3, 1
		sb	$s3, 4($s1)
		daddi	$a3, $zero, vec2
		jal 	recorrer
		daddi	$s3, $s3, 1
		sb	$s3, 4($s1)
		daddi	$a3, $zero, vec1
		jal 	recorrer
		halt

    recorrer:	daddi	$s2, $zero, 20
	loop:	lbu	$t1, 0($a3)
		beqz	$t1, fin
		beq	$t1, $a0, aumento
		beq $t1, $a1, pintarnegro
		lwu	$s4, colorA($zero)
		j sigue
	pintarnegro: lwu $s4, colorN($zero)
	sigue:	sw	$s4, 0($s1)		 
      imprimir:	sb	$s2, 5($s1)
		daddi	$t2, $zero, 5
		sd	$t2, 0($s0)
	
      aumento:	daddi	$a3, $a3, 1
		daddi	$s2, $s2, 1
		j loop
     fin:	jr $ra
