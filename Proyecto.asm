name "Decimal a binario"

org 100h

jmp start

;Mensaje en pantalla
msg1 db 0Dh,0Ah, 'Ingresar cualquier numero: $'
msg2 db 0Dh,0Ah, 'Forma binaria: $'

; buffer para int 21h/0ah
; primer byte es en el tamano de buffer,
; segundo byte es el numero de chars actualmente leidos (establecer por int 21/0ah)
 buffer db 7,?, 5 dup (0), 0, 0

;Para resultados:
binary dw ?

start:

;imprime mensaje de bienvenida:
mov dx, offset msg1
mov ah, 9
int 21h

; input string:
mov dx, offset buffer
mov ah, 0ah
int 21h

; Presionar (0) para terminar:
mov bx, 0     
mov bl, buffer[1]
mov buffer[bx+2], 0

lea  si, buffer + 2 ;Buffer inicia del 3er byte
call  tobin

; el numero se guarda en el registro cx
; de -1234 it s 0fb2eh

mov binary, cx

jcxz stop
   
   
; imprime el preresultado:
mov dx, offset msg2
mov ah, 9
int 21h

;imprime en forma binaria
mov bx, binary
mov cx, 16
print: mov ah, 2  ; imprime funcion.
       mov dl, '0'
       test bx, 1000000000000000b  ; se testea el primer byte
       jz zero
       mov dl, '1'
zero:  int 21h
       shl bx, 1
loop print

; imprime el suffix
mov dl, 'b'
int 21h

jmp start ;lopp

stop:

ret ; regresar al sistema de control



;Comentarios del video desde la linea 75 a la 79
    
tobin   proc   near
        push   dx
        push   ax
        push   si
        
jmp process

;=== Variables locales ===
make_minus   db   ?    ; usado como una bandera 
ten          dw   10   ; usado como multiplayer
;==============================================

process:

         ; reiniciar el acumulador:
         mov   cx, 0
         
         ; reseterar la bandera:
         mov   cs:make_minus, 0
           
           
next_digit:

         ; leer char a al y
         ; apuntar a el siguiente byte:
         mov   al, [si]
         inc   si
         
             ; Checar el final del string:
             cmp   al, 0 
             jne   not_end
             jmp   stop_input
not_end:

             ; Chequeo para el minimo
             cmp   al, '-'
             jne   ok_digit
             mov   cs:make_minus, 1 ; Establecer bandera!
         jmp   next_digit

ok_digit:

          ; multiplicar cx por 10 (primera vez que el resultado es correcto)
          push   ax
          mov    ax, cx
          mul    cs:ten
          mov    cx, ax
          pop    ax
          
        ; es asumido que dx es cero - overflow no checado
        
           ; Convertir de codigo ascii :
           sub   al, 30h
           
           ; Agregar al to cx :
           mov   ah, 0
           mov   dx, cx    ; respaldo, en caso que el resultado sea muy grande
           add   cx, ax
           
           ; Agregar - overflow no checado
           
           jmp   next_digit
           
stop_input:

        ; Checar bandera, si el numero string tenia '-'
        ; Estar seguro que el resultado es negativo:
        cmp   cs:make_minus, 0
        je    not_minus
        neg   cx
        
not_minus:

        pop   si
        pop   ax
        pop   dx
        ret
tobin        endp

ret