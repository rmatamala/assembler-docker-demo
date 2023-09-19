section .data
    result db "El resultado es: %d", 10, 0

section .text
    global main

main:
    mov ecx, 10        ; Cargar el contador con 10
    mov eax, 0         ; Inicializar el acumulador a 0

loop_start:
    add eax, ecx       ; Sumar el valor actual del contador al acumulador
    loop loop_start    ; Decrementar el contador y repetir mientras no sea cero

    push eax           ; Guardar el resultado en la pila
    push dword result  ; Guardar la cadena de formato en la pila
    call printf        ; Llamar a la función printf de la biblioteca C
    add esp, 8         ; Limpiar los argumentos de la pila después de la llamada

    ; Salir del programa
    mov eax, 1         ; Código de salida del programa
    xor ebx, ebx       ; Código de error
    int 0x80           ; Llamar a la interrupción del sistema operativo

section .data
    extern printf
