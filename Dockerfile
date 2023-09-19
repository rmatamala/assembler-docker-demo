# Utilizar una imagen base con el sistema operativo y herramientas necesarias
FROM ubuntu:latest

# Instalar NASM y GCC
RUN apt-get update && apt-get install -y nasm gcc-multilib

# Copiar los archivos fuente al contenedor
COPY sumaNumeros.asm /app/sumaNumeros.asm

# Establecer el directorio de trabajo
WORKDIR /app

# Compilar el archivo en lenguaje ensamblador utilizando NASM y GCC
RUN nasm -f elf sumaNumeros.asm -o sumaNumeros.o
RUN gcc -m32 sumaNumeros.o -o sumaNumeros

# Ejecutar el archivo resultante
CMD ["./sumaNumeros"]
