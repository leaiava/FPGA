# Trabajo Practico Final
## Circuitos Lógicos Programables
### Especialización en Sistemas Embebidos

Se diseñó un oscilador de onda senoidal controlado numéricamente al cual se le puede ajustar la frecuencia y la amplitud de salida para funcionar en la placa de desarrollo de Xilinx Arty Z7-10.

 ### Descripcion de los archivos:

 - RCF.vhd: Bloque registro control de frecuencia.
 - att.vhd: Bloque de atenuacion.
 - mem_seno.vhd: Bloque con la memoria de la señal senoidal.
 - NCO.vhd: Programa principal donde se instancias los 3 componentes anteriores.
 - NCO_tb.vhd: Banco de prueba para el NCO.vhd
 - NCO_IP: Se montó junto al NCO un VIO y un ILA para probar el dispositivo