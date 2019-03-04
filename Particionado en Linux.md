# Particionado con discos en GNU/Linux

## Asociar volumen

Vamos a utilizar el sistema operativo Debian en una máquina virtual en VirtualBox.
La capacidad del volumen es de 1GB.

## Comando fdisk

- Primeras particiones:
Primaria de 150MB para sistema de ficheros Linux.
Extendida en el resto del espacio.
5 particiones lógicas iguales dentro de la extendida
	1 para swap
	2 para linux
	1 ntfs
	1 FAT32

Ver los discos disponibles:
~~~
usuario@debian:~$ lsblk -f
NAME   FSTYPE  LABEL             UUID                                 MOUNTPOINT
sda                                                                   
├─sda1 ext4                      e401a03e-3f11-441a-9f97-118e112ff941 /
├─sda2                                                                
└─sda5 swap                      fdbfbc2d-d60c-4cb9-989d-974067aa5004 [SWAP]
sdb                                                                   
sr0    iso9660 VBOXADDITIONS_5.1.38_122592
                                 2018-05-09-11-31-22-00               /media/cdr
~~~

Entrar en la configuración de formateo:
~~~
usuario@debian:~$ fdisl /dev/sdb
bash: fdisl: no se encontró la orden
usuario@debian:~$ fdisk /dev/sdb
bash: fdisk: no se encontró la orden
usuario@debian:~$ su
Contraseña: 
root@debian:/home/usuario# fdisk /dev/sdb

Bienvenido a fdisk (util-linux 2.29.2).
Los cambios solo permanecerán en la memoria, hasta que decida escribirlos.
Tenga cuidado antes de utilizar la orden de escritura.

El dispositivo no contiene una tabla de particiones reconocida.
Se ha creado una nueva etiqueta de disco DOS con el identificador de disco 0x0ba68001.

Orden (m para obtener ayuda): 
~~~

Creación de la primera partición
~~~
Orden (m para obtener ayuda): n
Tipo de partición
   p   primaria (0 primaria(s), 0 extendida(s), 4 libre(s))
   e   extendida (contenedor para particiones lógicas)
Seleccionar (valor predeterminado p): p
Número de partición (1-4, valor predeterminado 1): 1
Primer sector (2048-2097151, valor predeterminado 2048): 2048
Último sector, +sectores o +tamaño{K,M,G,T,P} (2048-2097151, valor predeterminado 2097151): +150M

Crea una nueva partición 1 de tipo 'Linux' y de tamaño 150 MiB.

Orden (m para obtener ayuda): p
Disco /dev/sdb: 1 GiB, 1073741824 bytes, 2097152 sectores
Unidades: sectores de 1 * 512 = 512 bytes
Tamaño de sector (lógico/físico): 512 bytes / 512 bytes
Tamaño de E/S (mínimo/óptimo): 512 bytes / 512 bytes
Tipo de etiqueta de disco: dos
Identificador del disco: 0x0ba68001

Disposit.  Inicio Comienzo  Final Sectores Tamaño Id Tipo
/dev/sdb1             2048 309247   307200   150M 83 Linu

Orden (m para obtener ayuda): w
Se ha modificado la tabla de particiones.
Llamando a ioctl() para volver a leer la tabla de particiones.
Se están sincronizando los discos.
~~~

Creación de extendida:

~~~
root@debian:/home/usuario# fdisk /dev/sdb

Bienvenido a fdisk (util-linux 2.29.2).
Los cambios solo permanecerán en la memoria, hasta que decida escribirlos.
Tenga cuidado antes de utilizar la orden de escritura.


Orden (m para obtener ayuda): n
Tipo de partición
   p   primaria (1 primaria(s), 0 extendida(s), 3 libre(s))
   e   extendida (contenedor para particiones lógicas)
Seleccionar (valor predeterminado p): e
Número de partición (2-4, valor predeterminado 2): 2
Primer sector (309248-2097151, valor predeterminado 309248): 
Último sector, +sectores o +tamaño{K,M,G,T,P} (309248-2097151, valor predeterminado 2097151): 

Crea una nueva partición 2 de tipo 'Extended' y de tamaño 873 MiB.

Orden (m para obtener ayuda): p
Disco /dev/sdb: 1 GiB, 1073741824 bytes, 2097152 sectores
Unidades: sectores de 1 * 512 = 512 bytes
Tamaño de sector (lógico/físico): 512 bytes / 512 bytes
Tamaño de E/S (mínimo/óptimo): 512 bytes / 512 bytes
Tipo de etiqueta de disco: dos
Identificador del disco: 0x0ba68001

Disposit.  Inicio Comienzo   Final Sectores Tamaño Id Tipo
/dev/sdb1             2048  309247   307200   150M 83 Linu
/dev/sdb2           309248 2097151  1787904   873M  5 Exte
~~~

Creación de las 5 particiones lógicas:
~~~
Orden (m para obtener ayuda): n
Se está utilizando todo el espacio para particiones primarias.
Se añade la partición lógica 5
Primer sector (311296-2097151, valor predeterminado 311296): 
Último sector, +sectores o +tamaño{K,M,G,T,P} (311296-2097151, valor predeterminado 2097151): +175M

Crea una nueva partición 5 de tipo 'Linux' y de tamaño 175 MiB.

Orden (m para obtener ayuda): n
Se está utilizando todo el espacio para particiones primarias.
Se añade la partición lógica 6
Primer sector (671744-2097151, valor predeterminado 671744): 
Último sector, +sectores o +tamaño{K,M,G,T,P} (671744-2097151, valor predeterminado 2097151): +175M

Crea una nueva partición 6 de tipo 'Linux' y de tamaño 175 MiB.

Orden (m para obtener ayuda): n
Se está utilizando todo el espacio para particiones primarias.
Se añade la partición lógica 7
Primer sector (1032192-2097151, valor predeterminado 1032192): 
Último sector, +sectores o +tamaño{K,M,G,T,P} (1032192-2097151, valor predeterminado 2097151): +175M

Crea una nueva partición 7 de tipo 'Linux' y de tamaño 175 MiB.

Orden (m para obtener ayuda): n
Se está utilizando todo el espacio para particiones primarias.
Se añade la partición lógica 8
Primer sector (1392640-2097151, valor predeterminado 1392640): 
Último sector, +sectores o +tamaño{K,M,G,T,P} (1392640-2097151, valor predeterminado 2097151): +175M

Crea una nueva partición 8 de tipo 'Linux' y de tamaño 175 MiB.

Orden (m para obtener ayuda): n
Se está utilizando todo el espacio para particiones primarias.
Se añade la partición lógica 9
Primer sector (1753088-2097151, valor predeterminado 1753088): 
Último sector, +sectores o +tamaño{K,M,G,T,P} (1753088-2097151, valor predeterminado 2097151): 

Crea una nueva partición 9 de tipo 'Linux' y de tamaño 168 MiB.

Orden (m para obtener ayuda): p
Disco /dev/sdb: 1 GiB, 1073741824 bytes, 2097152 sectores
Unidades: sectores de 1 * 512 = 512 bytes
Tamaño de sector (lógico/físico): 512 bytes / 512 bytes
Tamaño de E/S (mínimo/óptimo): 512 bytes / 512 bytes
Tipo de etiqueta de disco: dos
Identificador del disco: 0x0ba68001

Disposit.  Inicio Comienzo   Final Sectores Tamaño Id Tipo
/dev/sdb1             2048  309247   307200   150M 83 Linu
/dev/sdb2           309248 2097151  1787904   873M  5 Exte
/dev/sdb5           311296  669695   358400   175M 83 Linu
/dev/sdb6           671744 1030143   358400   175M 83 Linu
/dev/sdb7          1032192 1390591   358400   175M 83 Linu
/dev/sdb8          1392640 1751039   358400   175M 83 Linu
/dev/sdb9          1753088 2097151   344064   168M 83 Linu
~~~

Cambiar el tipo de las particiones:
~~~
Orden (m para obtener ayuda): t
Número de partición (1,2,5-9, valor predeterminado 9): 5
Tipo de partición (teclee L para ver todos los tipos): 7

Se ha cambiado el tipo de la partición 'Linux' a 'HPFS/NTFS/exFAT'.

Orden (m para obtener ayuda): t
Número de partición (1,2,5-9, valor predeterminado 9): 6
Tipo de partición (teclee L para ver todos los tipos): b

Se ha cambiado el tipo de la partición 'Linux' a 'W95 FAT32'.

Orden (m para obtener ayuda): t
Número de partición (1,2,5-9, valor predeterminado 9): 7 
Tipo de partición (teclee L para ver todos los tipos): 82

Se ha cambiado el tipo de la partición 'Linux' a 'Linux swap / Solaris'.

Orden (m para obtener ayuda): p
Disco /dev/sdb: 1 GiB, 1073741824 bytes, 2097152 sectores
Unidades: sectores de 1 * 512 = 512 bytes
Tamaño de sector (lógico/físico): 512 bytes / 512 bytes
Tamaño de E/S (mínimo/óptimo): 512 bytes / 512 bytes
Tipo de etiqueta de disco: dos
Identificador del disco: 0x0ba68001

Disposit.  Inicio Comienzo   Final Sectores Tamaño Id Tipo
/dev/sdb1             2048  309247   307200   150M 83 Linu
/dev/sdb2           309248 2097151  1787904   873M  5 Exte
/dev/sdb5           311296  669695   358400   175M  7 HPFS
/dev/sdb6           671744 1030143   358400   175M  b W95 
/dev/sdb7          1032192 1390591   358400   175M 82 Linu
/dev/sdb8          1392640 1751039   358400   175M 83 Linu
/dev/sdb9          1753088 2097151   344064   168M 83 Linu

Orden (m para obtener ayuda): w
Se ha modificado la tabla de particiones.
Llamando a ioctl() para volver a leer la tabla de particiones.
Se están sincronizando los discos.
~~~

Formateo sdb1:
~~~
root@debian:/home/usuario# mkfs.ext4 /dev/sdb1
mke2fs 1.43.4 (31-Jan-2017)
Se está creando un sistema de ficheros con 153600 bloques de 1k y 38456 nodos-i
UUID del sistema de ficheros: 87f41f69-49b3-48b7-9722-834a545bdcf0
Respaldo del superbloque guardado en los bloques: 
	8193, 24577, 40961, 57345, 73729

Reservando las tablas de grupo: hecho                           
Escribiendo las tablas de nodos-i: hecho                           
Creando el fichero de transacciones (4096 bloques): hecho
Escribiendo superbloques y la información contable del sistema de ficheros: hecho
~~~

Formateo:
~~~
root@debian:/home/usuario# mkfs.ext4 /dev/sdb8
mke2fs 1.43.4 (31-Jan-2017)
Se está creando un sistema de ficheros con 179200 bloques de 1k y 44880 nodos-i
UUID del sistema de ficheros: 4a2e248d-722e-44f9-b500-06bbb6019103
Respaldo del superbloque guardado en los bloques: 
	8193, 24577, 40961, 57345, 73729

Reservando las tablas de grupo: hecho                           
Escribiendo las tablas de nodos-i: hecho                           
Creando el fichero de transacciones (4096 bloques): hecho
Escribiendo superbloques y la información contable del sistema de ficheros: hecho

root@debian:/home/usuario# mkfs.ext4 /dev/sdb9
mke2fs 1.43.4 (31-Jan-2017)
Se está creando un sistema de ficheros con 172032 bloques de 1k y 43008 nodos-i
UUID del sistema de ficheros: 7c79e8a3-1945-413f-9896-d386f749354d
Respaldo del superbloque guardado en los bloques: 
	8193, 24577, 40961, 57345, 73729

Reservando las tablas de grupo: hecho                           
Escribiendo las tablas de nodos-i: hecho                           
Creando el fichero de transacciones (4096 bloques): hecho
Escribiendo superbloques y la información contable del sistema de ficheros: hecho

root@debian:/home/usuario# mkfs.ntfs /dev/sdb5
Cluster size has been automatically set to 4096 bytes.
Initializing device with zeroes: 100% - Done.
Creating NTFS volume structures.
mkntfs completed successfully. Have a nice day.
root@debian:/home/usuario# mkfs.vfat /dev/sdb6
mkfs.fat 4.1 (2017-01-24)
root@debian:/home/usuario# mkswap /dev/sdb7
Configurando espacio de intercambio versión 1, tamaño = 175 MiB (183496704 bytes)
sin etiqueta, UUID=2e3143d1-4627-49bb-b3ec-1358d2759c27
root@debian:/home/usuario# lsblk -f
NAME   FSTYPE LABEL UUID                                 MOUNTPOINT
sda                                                      
├─sda1 ext4         e401a03e-3f11-441a-9f97-118e112ff941 /
├─sda2                                                   
└─sda5 swap         fdbfbc2d-d60c-4cb9-989d-974067aa5004 [SWAP]
sdb                                                      
├─sdb1 ext4         87f41f69-49b3-48b7-9722-834a545bdcf0 
├─sdb2                                                   
├─sdb5 ntfs         4B1020C64B234E59                     
├─sdb6 vfat         84DC-B1A8                            
├─sdb7 swap         2e3143d1-4627-49bb-b3ec-1358d2759c27 
├─sdb8 ext4         4a2e248d-722e-44f9-b500-06bbb6019103 
└─sdb9 ext4         7c79e8a3-1945-413f-9896-d386f749354d 
sr0    iso966 VBOXADDITIONS_5.1.38_122592
                    2018-05-09-11-31-22-00               /media/cdr
root@debian:/hom
~~~


- Segundas particiones:

Primera partición primaria de 200MB
Segunda partición primaria de 100MB
Hueco de 500MB
Partición extendida con el resto

Creación particiones primarias:
~~~
Orden (m para obtener ayuda): n
Tipo de partición
   p   primaria (0 primaria(s), 0 extendida(s), 4 libre(s))
   e   extendida (contenedor para particiones lógicas)
Seleccionar (valor predeterminado p): p
Número de partición (1-4, valor predeterminado 1): 
Primer sector (2048-2097151, valor predeterminado 2048): 
Último sector, +sectores o +tamaño{K,M,G,T,P} (2048-2097151, valor predeterminado 2097151): +200M

Crea una nueva partición 1 de tipo 'Linux' y de tamaño 200 MiB.

Orden (m para obtener ayuda): n
Tipo de partición
   p   primaria (1 primaria(s), 0 extendida(s), 3 libre(s))
   e   extendida (contenedor para particiones lógicas)
Seleccionar (valor predeterminado p): p
Número de partición (2-4, valor predeterminado 2): 
Primer sector (411648-2097151, valor predeterminado 411648): 
Último sector, +sectores o +tamaño{K,M,G,T,P} (411648-2097151, valor predeterminado 2097151): +100M

Crea una nueva partición 2 de tipo 'Linux' y de tamaño 100 MiB.

Orden (m para obtener ayuda): p
Disco /dev/sdb: 1 GiB, 1073741824 bytes, 2097152 sectores
Unidades: sectores de 1 * 512 = 512 bytes
Tamaño de sector (lógico/físico): 512 bytes / 512 bytes
Tamaño de E/S (mínimo/óptimo): 512 bytes / 512 bytes
Tipo de etiqueta de disco: dos
Identificador del disco: 0xa3f1a9d5

Disposit.  Inicio Comienzo  Final Sectores Tamaño Id Tipo
/dev/sdb1             2048 411647   409600   200M 83 Linu
/dev/sdb2           411648 616447   204800   100M 83 Linu

Orden (m para obtener ayuda): w
Se ha modificado la tabla de particiones.
Llamando a ioctl() para volver a leer la tabla de particiones.
Se están sincronizando los discos.
~~~

Creación de la partición swap:
~~~
Orden (m para obtener ayuda): n
Tipo de partición
   p   primaria (2 primaria(s), 0 extendida(s), 2 libre(s))
   e   extendida (contenedor para particiones lógicas)
Seleccionar (valor predeterminado p): e
Número de partición (3,4, valor predeterminado 3): 
Primer sector (616448-2097151, valor predeterminado 616448): 1640448
Último sector, +sectores o +tamaño{K,M,G,T,P} (1640448-2097151, valor predeterminado 2097151): 

Crea una nueva partición 3 de tipo 'Extended' y de tamaño 223 MiB.

Orden (m para obtener ayuda): t
Número de partición (1-3, valor predeterminado 3): 3
Tipo de partición (teclee L para ver todos los tipos): 82

Se ha cambiado el tipo de la partición 'Extended' a 'Linux swap / Solaris'.

Orden (m para obtener ayuda): p
Disco /dev/sdb: 1 GiB, 1073741824 bytes, 2097152 sectores
Unidades: sectores de 1 * 512 = 512 bytes
Tamaño de sector (lógico/físico): 512 bytes / 512 bytes
Tamaño de E/S (mínimo/óptimo): 512 bytes / 512 bytes
Tipo de etiqueta de disco: dos
Identificador del disco: 0xa3f1a9d5

Disposit.  Inicio Comienzo   Final Sectores Tamaño Id Tipo
/dev/sdb1             2048  411647   409600   200M 83 Linu
/dev/sdb2           411648  616447   204800   100M 83 Linu
/dev/sdb3          1640448 2097151   456704   223M 82 Linu

Orden (m para obtener ayuda): w
Se ha modificado la tabla de particiones.
Llamando a ioctl() para volver a leer la tabla de particiones.
Se están sincronizando los discos.
~~~

Formateo de las particiones:
~~~
root@debian:/home/usuario# mkfs.ext4 /dev/sdb1
mke2fs 1.43.4 (31-Jan-2017)
Se está creando un sistema de ficheros con 204800 bloques de 1k y 51200 nodos-i
UUID del sistema de ficheros: ffab77da-8dc8-4ec8-aa63-4d8f3401c851
Respaldo del superbloque guardado en los bloques: 
	8193, 24577, 40961, 57345, 73729

Reservando las tablas de grupo: hecho                           
Escribiendo las tablas de nodos-i: hecho                           
Creando el fichero de transacciones (4096 bloques): hecho
Escribiendo superbloques y la información contable del sistema de ficheros: hecho

root@debian:/home/usuario# mkfs.ext4 /dev/sdb2
mke2fs 1.43.4 (31-Jan-2017)
Se está creando un sistema de ficheros con 102400 bloques de 1k y 25688 nodos-i
UUID del sistema de ficheros: d6a34d15-4d2b-4415-adfc-0a3fa648afc8
Respaldo del superbloque guardado en los bloques: 
	8193, 24577, 40961, 57345, 73729

Reservando las tablas de grupo: hecho                           
Escribiendo las tablas de nodos-i: hecho                           
Creando el fichero de transacciones (4096 bloques): hecho
Escribiendo superbloques y la información contable del sistema de ficheros: hecho

root@debian:/home/usuario# mkswap /dev/sdb3
Configurando espacio de intercambio versión 1, tamaño = 223 MiB (233828352 bytes)
sin etiqueta, UUID=b53e8723-a1c3-497f-84bc-3731bd6a9855
root@debian:/home/usuario# lsblk -f
NAME   FSTYPE LABEL UUID                                 MOUNTPOINT
sda                                                      
├─sda1 ext4         e401a03e-3f11-441a-9f97-118e112ff941 /
├─sda2                                                   
└─sda5 swap         fdbfbc2d-d60c-4cb9-989d-974067aa5004 [SWAP]
sdb                                                      
├─sdb1 ext4         ffab77da-8dc8-4ec8-aa63-4d8f3401c851 
├─sdb2 ext4         d6a34d15-4d2b-4415-adfc-0a3fa648afc8 
└─sdb3 swap         b53e8723-a1c3-497f-84bc-3731bd6a9855 
sr0    iso966 VBOXADDITIONS_5.1.38_122592
                    2018-05-09-11-31-22-00               /media/cdr
~~~



## Comando gdisk

- Partición:
Partición primaria 150MB tipo Linux
Partición lógica Linux
Partición lógica Linux
Partición lógica NTFS
Partición lógica FAT32
Partición lógica swap

Configuración de particiones:
~~~
root@debian:/home/usuario# gdisk /dev/sdb
GPT fdisk (gdisk) version 1.0.1

Partition table scan:
  MBR: not present
  BSD: not present
  APM: not present
  GPT: not present

Creating new GPT entries.

Command (? for help): 
~~~

Creación de la particiones:
~~~
Command (? for help): n
Partition number (1-128, default 1): 
First sector (34-2097118, default = 2048) or {+-}size{KMGTP}: 
Last sector (2048-2097118, default = 2097118) or {+-}size{KMGTP}: +150M        
Current type is 'Linux filesystem'
Hex code or GUID (L to show codes, Enter = 8300): 
Changed type of partition to 'Linux filesystem'

Command (? for help): n
Partition number (2-128, default 2): 
First sector (34-2097118, default = 309248) or {+-}size{KMGTP}: 
Last sector (309248-2097118, default = 2097118) or {+-}size{KMGTP}: +175M
Current type is 'Linux filesystem'
Hex code or GUID (L to show codes, Enter = 8300): 
Changed type of partition to 'Linux filesystem'

Command (? for help): n
Partition number (3-128, default 3): 
First sector (34-2097118, default = 667648) or {+-}size{KMGTP}: 
Last sector (667648-2097118, default = 2097118) or {+-}size{KMGTP}: +175M
Current type is 'Linux filesystem'
Hex code or GUID (L to show codes, Enter = 8300): 
Changed type of partition to 'Linux filesystem'

Command (? for help): n
Partition number (4-128, default 4): 
First sector (34-2097118, default = 1026048) or {+-}size{KMGTP}: 
Last sector (1026048-2097118, default = 2097118) or {+-}size{KMGTP}: +175M
Current type is 'Linux filesystem'
Hex code or GUID (L to show codes, Enter = 8300): 4202
Changed type of partition to 'Windows Storage Spaces'

Command (? for help): n
Partition number (5-128, default 5): 
First sector (34-2097118, default = 1384448) or {+-}size{KMGTP}: 
Last sector (1384448-2097118, default = 2097118) or {+-}size{KMGTP}: +175M
Current type is 'Linux filesystem'
Hex code or GUID (L to show codes, Enter = 8300): 4202
Changed type of partition to 'Windows Storage Spaces'

Command (? for help): n
Partition number (6-128, default 6): 
First sector (34-2097118, default = 1742848) or {+-}size{KMGTP}: 
Last sector (1742848-2097118, default = 2097118) or {+-}size{KMGTP}: 
Current type is 'Linux filesystem'
Hex code or GUID (L to show codes, Enter = 8300): 8200
Changed type of partition to 'Linux swap'

Command (? for help): p
Disk /dev/sdb: 2097152 sectors, 1024.0 MiB
Logical sector size: 512 bytes
Disk identifier (GUID): DBCCC629-A4CF-475C-9A20-39CDAA6266CE
Partition table holds up to 128 entries
First usable sector is 34, last usable sector is 2097118
Partitions will be aligned on 2048-sector boundaries
Total free space is 2014 sectors (1007.0 KiB)

Number  Start (sector)    End (sector)  Size       Code  Name
   1            2048          309247   150.0 MiB   8300  Linux filesystem
   2          309248          667647   175.0 MiB   8300  Linux filesystem
   3          667648         1026047   175.0 MiB   8300  Linux filesystem
   4         1026048         1384447   175.0 MiB   4202  Windows Storage Spaces
   5         1384448         1742847   175.0 MiB   4202  Windows Storage Spaces
   6         1742848         2097118   173.0 MiB   8200  Linux swap

Command (? for help): w

Final checks complete. About to write GPT data. THIS WILL OVERWRITE EXISTING
PARTITIONS!!

Do you want to proceed? (Y/N): y
OK; writing new GUID partition table (GPT) to /dev/sdb.
The operation has completed successfully.
~~~

Formateo de las particiones:
~~~
root@debian:/home/usuario# mkfs.ext4 /dev/sdb1
mke2fs 1.43.4 (31-Jan-2017)
Se está creando un sistema de ficheros con 153600 bloques de 1k y 38456 nodos-i
UUID del sistema de ficheros: 0e7a7d49-89d7-430d-9a51-8832677073e4
Respaldo del superbloque guardado en los bloques: 
	8193, 24577, 40961, 57345, 73729

Reservando las tablas de grupo: hecho                           
Escribiendo las tablas de nodos-i: hecho                           
Creando el fichero de transacciones (4096 bloques): hecho
Escribiendo superbloques y la información contable del sistema de ficheros: hecho

root@debian:/home/usuario# mkfs.ext4 /dev/sdb2
mke2fs 1.43.4 (31-Jan-2017)
Se está creando un sistema de ficheros con 179200 bloques de 1k y 44880 nodos-i
UUID del sistema de ficheros: 7d89972c-40e4-47fb-97c6-146c3c316f55
Respaldo del superbloque guardado en los bloques: 
	8193, 24577, 40961, 57345, 73729

Reservando las tablas de grupo: hecho                           
Escribiendo las tablas de nodos-i: hecho                           
Creando el fichero de transacciones (4096 bloques): hecho
Escribiendo superbloques y la información contable del sistema de ficheros: hecho

root@debian:/home/usuario# mkfs.ext4 /dev/sdb3
mke2fs 1.43.4 (31-Jan-2017)
Se está creando un sistema de ficheros con 179200 bloques de 1k y 44880 nodos-i
UUID del sistema de ficheros: bc5824e8-f97d-44d7-96b9-5fb0586c56ef
Respaldo del superbloque guardado en los bloques: 
	8193, 24577, 40961, 57345, 73729

Reservando las tablas de grupo: hecho                           
Escribiendo las tablas de nodos-i: hecho                           
Creando el fichero de transacciones (4096 bloques): hecho
Escribiendo superbloques y la información contable del sistema de ficheros: hecho

root@debian:/home/usuario# mkfs.ntfs /dev/sdb4
Cluster size has been automatically set to 4096 bytes.
Initializing device with zeroes: 100% - Done.
Creating NTFS volume structures.
mkntfs completed successfully. Have a nice day.
root@debian:/home/usuario# mkfs.vfat /dev/sdb5
mkfs.fat 4.1 (2017-01-24)
root@debian:/home/usuario# mkswap /dev/sdb6
Configurando espacio de intercambio versión 1, tamaño = 173 MiB (181379072 bytes)
sin etiqueta, UUID=ab8902b4-d8c4-4353-acb3-4f5dbe2e73fb
root@debian:/home/usuario# lsblk -f
NAME   FSTYPE LABEL UUID                                 MOUNTPOINT
sda                                                      
├─sda1 ext4         e401a03e-3f11-441a-9f97-118e112ff941 /
├─sda2                                                   
└─sda5 swap         fdbfbc2d-d60c-4cb9-989d-974067aa5004 [SWAP]
sdb                                                      
├─sdb1 ext4         0e7a7d49-89d7-430d-9a51-8832677073e4 
├─sdb2 ext4         7d89972c-40e4-47fb-97c6-146c3c316f55 
├─sdb3 ext4         bc5824e8-f97d-44d7-96b9-5fb0586c56ef 
├─sdb4 ntfs         1B24D3931D793347                     
├─sdb5 vfat         F3DD-7815                            
└─sdb6 swap         ab8902b4-d8c4-4353-acb3-4f5dbe2e73fb 
sr0    iso966 VBOXADDITIONS_5.1.38_122592
                    2018-05-09-11-31-22-00               /media/cdr
root@debian:/home/usuario# 
~~~

