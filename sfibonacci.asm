# imprime los primeros 12 de la serie fibo
      .data
fibbs: .word   0 : 12        # "array"
size: .word  12             # Tamaño del array 
      .text
      la   $t0, fibbs        # carga direccion del array
      la   $t5, size        #
      lw   $t5, 0($t5)      # 
      li   $t2, 1           # 1 es el numero inicial y el segundo tambien
      add.d $f0, $f2, $f4
      sw   $t2, 0($t0)      # F[0] = 1
      sw   $t2, 4($t0)      # F[1] = F[0] = 1
      addi $t1, $t5, -2     # Contador para ciclo
loop: lw   $t3, 0($t0)      # le llega el valor del array F[n] 
      lw   $t4, 4($t0)      # valor del array F[n+1]
      add  $t2, $t3, $t4    # $t2 = F[n] + F[n+1]
      sw   $t2, 8($t0)      # guarda F[n+2] = F[n] + F[n+1] 
      addi $t0, $t0, 4      # incremento en array 
      addi $t1, $t1, -1     # decremento contador del ciclo
      bgtz $t1, loop        # repite por si no ha terminado.
      la   $a0, fibbs        # impresion del primer numero
      add  $a1, $zero, $t5  # segundo numero a imprimir
      jal  print            # llama la rutina de impresion
      li   $v0, 10          # salida
      syscall               # 
		
#########  para imprimir los numero en linea

      .data
space:.asciiz  " "          # espacio
head: .asciiz  "serie fibo es:\n"
      .text
print:add  $t0, $zero, $a0  # inicio del array
      add  $t1, $zero, $a1  # inicializacion
      la   $a0, head        # carga lo que se va a imprimir
      li   $v0, 4           # 
      syscall               # imprime cabezera "head"
out:  lw   $a0, 0($t0)      # carga fibo
      li   $v0, 1           # 
      syscall               # imprime numero fibo
      la   $a0, space       #  espacio
      li   $v0, 4           # 
      syscall               # 
      addi $t0, $t0, 4      # 
      addi $t1, $t1, -1     # 
      bgtz $t1, out         # 
      jr   $ra              # return
