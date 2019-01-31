# Particionado con discos en GNU/Linux


##Asociar volumen

Vamos a utilizar el sistema operativo Debian en una máquina virtual en VirtualBox.
La capacidad del volumen es de 1GB. 


## Comando fdisk

- Primeras particiones:
Primaria de 150MB para sistema de ficheros linux
Extendida del resto del espacio
5 particiones lógicas iguales dentro de la extendida
	1 para swap
	2 para linux
	1 ntfs
	1 FAT32


Entrar en el formateo del volumen:
+
+
+
+
+
+
+
+
+
+
+
+
+
+
+
+
+
+
+
+
+
+
+
~~~
root@debian:~# fdisk /dev/sdb

Bienvenido a fdisk (util-linux 2.29.2).
Los cambios solo permanecerán en la memoria, hasta que decida escribirlos.
Tenga cuidado antes de utilizar la orden de escritura.

El dispositivo no contiene una tabla de particiones reconocida.
Se ha creado una nueva etiqueta de disco DOS con el identificador de disco 0xe463b033.

Orden (m para obtener ayuda):
~~~
 

Creación de la partición primaria.
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
Identificador del disco: 0x2744f900

Disposit.  Inicio Comienzo  Final Sectores Tamaño Id Tipo
/dev/sdb1             2048 309247   307200   150M 83 Linux

Orden (m para obtener ayuda): w
Se ha modificado la tabla de particiones.
Llamando a ioctl() para volver a leer la tabla de particiones.
Se están sincronizando los discos.
                                                   
root@debian:~# 
~~~


Creación de las distintas particiones lógicas.
~~~
root@debian:~# fdisk /dev/sdb

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
Identificador del disco: 0x2744f900

Disposit.  Inicio Comienzo   Final Sectores Tamaño Id Tipo
/dev/sdb1             2048  309247   307200   150M 83 Linux
/dev/sdb2           309248 2097151  1787904   873M  5 Extendida

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
Identificador del disco: 0x2744f900

Disposit.  Inicio Comienzo   Final Sectores Tamaño Id Tipo
/dev/sdb1             2048  309247   307200   150M 83 Linux
/dev/sdb2           309248 2097151  1787904   873M  5 Extendida
/dev/sdb5           311296  669695   358400   175M 83 Linux
/dev/sdb6           671744 1030143   358400   175M 83 Linux
/dev/sdb7          1032192 1390591   358400   175M 83 Linux
/dev/sdb8          1392640 1751039   358400   175M 83 Linux
/dev/sdb9          1753088 2097151   344064   168M 83 Linux

Orden (m para obtener ayuda): t
Número de partición (1,2,5-9, valor predeterminado 9): 7
Tipo de partición (teclee L para ver todos los tipos): l

 0  Vacía           24  DOS de NEC      81  Minix / Linux a bf  Solaris        
 1  FAT12           27  NTFS de WinRE o 82  Linux swap / So c1  DRDOS/sec (FAT-
 2  XENIX root      39  Plan 9          83  Linux           c4  DRDOS/sec (FAT-
 3  XENIX usr       3c  PartitionMagic  84  OS/2 oculto o h c6  DRDOS/sec (FAT-
 4  FAT16 <32M      40  Venix 80286     85  Linux extendida c7  Syrinx         
 5  Extendida       41  PPC PReP Boot   86  Conjunto de vol da  Datos sin SF   
 6  FAT16           42  SFS             87  Conjunto de vol db  CP/M / CTOS / .
 7  HPFS/NTFS/exFAT 4d  QNX4.x          88  Linux plaintext de  Utilidad Dell  
 8  AIX             4e  QNX4.x segunda  8e  Linux LVM       df  BootIt         
 9  AIX arrancable  4f  QNX4.x tercera  93  Amoeba          e1  DOS access     
 a  Gestor de arran 50  OnTrack DM      94  Amoeba BBT      e3  DOS R/O        
 b  W95 FAT32       51  OnTrack DM6 Aux 9f  BSD/OS          e4  SpeedStor      
 c  W95 FAT32 (LBA) 52  CP/M            a0  Hibernación de  ea  alineamiento Ru
 e  W95 FAT16 (LBA) 53  OnTrack DM6 Aux a5  FreeBSD         eb  BeOS fs        
 f  W95 Ext'd (LBA) 54  OnTrackDM6      a6  OpenBSD         ee  GPT            
10  OPUS            55  EZ-Drive        a7  NeXTSTEP        ef  EFI (FAT-12/16/
11  FAT12 oculta    56  Golden Bow      a8  UFS de Darwin   f0  inicio Linux/PA
12  Compaq diagnost 5c  Priam Edisk     a9  NetBSD          f1  SpeedStor      
14  FAT16 oculta <3 61  SpeedStor       ab  arranque de Dar f4  SpeedStor      
16  FAT16 oculta    63  GNU HURD o SysV af  HFS / HFS+      f2  DOS secondary  
17  HPFS/NTFS ocult 64  Novell Netware  b7  BSDI fs         fb  VMFS de VMware 
18  SmartSleep de A 65  Novell Netware  b8  BSDI swap       fc  VMKCORE de VMwa
1b  FAT32 de W95 oc 70  DiskSecure Mult bb  Boot Wizard hid fd  Linux raid auto
1c  FAT32 de W95 (L 75  PC/IX           bc  Acronis FAT32 L fe  LANstep        
1e  FAT16 de W95 (L 80  Minix antiguo   be  arranque de Sol ff  BBT            
Tipo de partición (teclee L para ver todos los tipos): 7

Se ha cambiado el tipo de la partición 'Linux' a 'HPFS/NTFS/exFAT'.

Orden (m para obtener ayuda): t
Número de partición (1,2,5-9, valor predeterminado 9): 8
Tipo de partición (teclee L para ver todos los tipos): l

 0  Vacía           24  DOS de NEC      81  Minix / Linux a bf  Solaris        
 1  FAT12           27  NTFS de WinRE o 82  Linux swap / So c1  DRDOS/sec (FAT-
 2  XENIX root      39  Plan 9          83  Linux           c4  DRDOS/sec (FAT-
 3  XENIX usr       3c  PartitionMagic  84  OS/2 oculto o h c6  DRDOS/sec (FAT-
 4  FAT16 <32M      40  Venix 80286     85  Linux extendida c7  Syrinx         
 5  Extendida       41  PPC PReP Boot   86  Conjunto de vol da  Datos sin SF   
 6  FAT16           42  SFS             87  Conjunto de vol db  CP/M / CTOS / .
 7  HPFS/NTFS/exFAT 4d  QNX4.x          88  Linux plaintext de  Utilidad Dell  
 8  AIX             4e  QNX4.x segunda  8e  Linux LVM       df  BootIt         
 9  AIX arrancable  4f  QNX4.x tercera  93  Amoeba          e1  DOS access     
 a  Gestor de arran 50  OnTrack DM      94  Amoeba BBT      e3  DOS R/O        
 b  W95 FAT32       51  OnTrack DM6 Aux 9f  BSD/OS          e4  SpeedStor      
 c  W95 FAT32 (LBA) 52  CP/M            a0  Hibernación de  ea  alineamiento Ru
 e  W95 FAT16 (LBA) 53  OnTrack DM6 Aux a5  FreeBSD         eb  BeOS fs        
 f  W95 Ext'd (LBA) 54  OnTrackDM6      a6  OpenBSD         ee  GPT            
10  OPUS            55  EZ-Drive        a7  NeXTSTEP        ef  EFI (FAT-12/16/
11  FAT12 oculta    56  Golden Bow      a8  UFS de Darwin   f0  inicio Linux/PA
12  Compaq diagnost 5c  Priam Edisk     a9  NetBSD          f1  SpeedStor      
14  FAT16 oculta <3 61  SpeedStor       ab  arranque de Dar f4  SpeedStor      
16  FAT16 oculta    63  GNU HURD o SysV af  HFS / HFS+      f2  DOS secondary  
17  HPFS/NTFS ocult 64  Novell Netware  b7  BSDI fs         fb  VMFS de VMware 
18  SmartSleep de A 65  Novell Netware  b8  BSDI swap       fc  VMKCORE de VMwa
1b  FAT32 de W95 oc 70  DiskSecure Mult bb  Boot Wizard hid fd  Linux raid auto
1c  FAT32 de W95 (L 75  PC/IX           bc  Acronis FAT32 L fe  LANstep        
1e  FAT16 de W95 (L 80  Minix antiguo   be  arranque de Sol ff  BBT            
Tipo de partición (teclee L para ver todos los tipos): b 

Se ha cambiado el tipo de la partición 'Linux' a 'W95 FAT32'.

Orden (m para obtener ayuda): t
Número de partición (1,2,5-9, valor predeterminado 9): 9
Tipo de partición (teclee L para ver todos los tipos): l

 0  Vacía           24  DOS de NEC      81  Minix / Linux a bf  Solaris        
 1  FAT12           27  NTFS de WinRE o 82  Linux swap / So c1  DRDOS/sec (FAT-
 2  XENIX root      39  Plan 9          83  Linux           c4  DRDOS/sec (FAT-
 3  XENIX usr       3c  PartitionMagic  84  OS/2 oculto o h c6  DRDOS/sec (FAT-
 4  FAT16 <32M      40  Venix 80286     85  Linux extendida c7  Syrinx         
 5  Extendida       41  PPC PReP Boot   86  Conjunto de vol da  Datos sin SF   
 6  FAT16           42  SFS             87  Conjunto de vol db  CP/M / CTOS / .
 7  HPFS/NTFS/exFAT 4d  QNX4.x          88  Linux plaintext de  Utilidad Dell  
 8  AIX             4e  QNX4.x segunda  8e  Linux LVM       df  BootIt         
 9  AIX arrancable  4f  QNX4.x tercera  93  Amoeba          e1  DOS access     
 a  Gestor de arran 50  OnTrack DM      94  Amoeba BBT      e3  DOS R/O        
 b  W95 FAT32       51  OnTrack DM6 Aux 9f  BSD/OS          e4  SpeedStor      
 c  W95 FAT32 (LBA) 52  CP/M            a0  Hibernación de  ea  alineamiento Ru
 e  W95 FAT16 (LBA) 53  OnTrack DM6 Aux a5  FreeBSD         eb  BeOS fs        
 f  W95 Ext'd (LBA) 54  OnTrackDM6      a6  OpenBSD         ee  GPT            
10  OPUS            55  EZ-Drive        a7  NeXTSTEP        ef  EFI (FAT-12/16/
11  FAT12 oculta    56  Golden Bow      a8  UFS de Darwin   f0  inicio Linux/PA
12  Compaq diagnost 5c  Priam Edisk     a9  NetBSD          f1  SpeedStor      
14  FAT16 oculta <3 61  SpeedStor       ab  arranque de Dar f4  SpeedStor      
16  FAT16 oculta    63  GNU HURD o SysV af  HFS / HFS+      f2  DOS secondary  
17  HPFS/NTFS ocult 64  Novell Netware  b7  BSDI fs         fb  VMFS de VMware 
18  SmartSleep de A 65  Novell Netware  b8  BSDI swap       fc  VMKCORE de VMwa
1b  FAT32 de W95 oc 70  DiskSecure Mult bb  Boot Wizard hid fd  Linux raid auto
1c  FAT32 de W95 (L 75  PC/IX           bc  Acronis FAT32 L fe  LANstep        
1e  FAT16 de W95 (L 80  Minix antiguo   be  arranque de Sol ff  BBT            
Tipo de partición (teclee L para ver todos los tipos): 82

Se ha cambiado el tipo de la partición 'Linux' a 'Linux swap / Solaris'.

Orden (m para obtener ayuda): p
Disco /dev/sdb: 1 GiB, 1073741824 bytes, 2097152 sectores
Unidades: sectores de 1 * 512 = 512 bytes
Tamaño de sector (lógico/físico): 512 bytes / 512 bytes
Tamaño de E/S (mínimo/óptimo): 512 bytes / 512 bytes
Tipo de etiqueta de disco: dos
Identificador del disco: 0x2744f900

Disposit.  Inicio Comienzo   Final Sectores Tamaño Id Tipo
/dev/sdb1             2048  309247   307200   150M 83 Linux
/dev/sdb2           309248 2097151  1787904   873M  5 Extendida
/dev/sdb5           311296  669695   358400   175M 83 Linux
/dev/sdb6           671744 1030143   358400   175M 83 Linux
/dev/sdb7          1032192 1390591   358400   175M  7 HPFS/NTFS/exFAT
/dev/sdb8          1392640 1751039   358400   175M  b W95 FAT32
/dev/sdb9          1753088 2097151   344064   168M 82 Linux swap / Solaris

Orden (m para obtener ayuda): w
Se ha modificado la tabla de particiones.
Llamando a ioctl() para volver a leer la tabla de particiones.
Se están sincronizando los discos.

root@debian:~# 
~~~


Formateo de las distintas particiones.
~~~
root@debian:~# mkfs.ext4 /dev/sdb1
mke2fs 1.43.4 (31-Jan-2017)
Se está creando un sistema de ficheros con 153600 bloques de 1k y 38456 nodos-i
UUID del sistema de ficheros: 8f286382-7d21-4bfe-bad7-3892ae70f074
Respaldo del superbloque guardado en los bloques: 
	8193, 24577, 40961, 57345, 73729

Reservando las tablas de grupo: hecho                           
Escribiendo las tablas de nodos-i: hecho                           
Creando el fichero de transacciones (4096 bloques): hecho
Escribiendo superbloques y la información contable del sistema de ficheros: hecho

root@debian:~# mkfs.ext4 /dev/sdb5
mke2fs 1.43.4 (31-Jan-2017)
Se está creando un sistema de ficheros con 179200 bloques de 1k y 44880 nodos-i
UUID del sistema de ficheros: bebf8bb5-ce05-45ab-9ced-f5f6eade1c23
Respaldo del superbloque guardado en los bloques: 
	8193, 24577, 40961, 57345, 73729

Reservando las tablas de grupo: hecho                           
Escribiendo las tablas de nodos-i: hecho                           
Creando el fichero de transacciones (4096 bloques): hecho
Escribiendo superbloques y la información contable del sistema de ficheros: hecho

root@debian:~# mkfs.ext4 /dev/sdb6
mke2fs 1.43.4 (31-Jan-2017)
Se está creando un sistema de ficheros con 179200 bloques de 1k y 44880 nodos-i
UUID del sistema de ficheros: e1f4a759-7d3f-4322-8728-acca96b31d5f
Respaldo del superbloque guardado en los bloques: 
	8193, 24577, 40961, 57345, 73729

Reservando las tablas de grupo: hecho                           
Escribiendo las tablas de nodos-i: hecho                           
Creando el fichero de transacciones (4096 bloques): hecho
Escribiendo superbloques y la información contable del sistema de ficheros: hecho

root@debian:~# mkfs.ntfs /dev/sdb7
Cluster size has been automatically set to 4096 bytes.
Initializing device with zeroes: 100% - Done.
Creating NTFS volume structures.
mkntfs completed successfully. Have a nice day.

root@debian:~# mkfs.vfat /dev/sdb8
mkfs.fat 4.1 (2017-01-24)

root@debian:~# mkswap /dev/sdb9
Configurando espacio de intercambio versión 1, tamaño = 168 MiB (176156672 bytes)
sin etiqueta, UUID=57037336-53c7-42dc-b55b-85a28a218e44

root@debian:~# lsblk -f
NAME   FSTYPE LABEL UUID                                 MOUNTPOINT
sda                                                      
├─sda1 ext4         9bb748be-c081-4450-8a0e-51903495fc92 /
├─sda2                                                   
└─sda5 swap         bff0697e-82c1-4182-bd1c-cac74dd0e016 [SWAP]
sdb                                                      
├─sdb1 ext4         8f286382-7d21-4bfe-bad7-3892ae70f074 
├─sdb2                                                   
├─sdb5 ext4         bebf8bb5-ce05-45ab-9ced-f5f6eade1c23 
├─sdb6 ext4         e1f4a759-7d3f-4322-8728-acca96b31d5f 
├─sdb7 ntfs         0D8AADC91FEF15E1                     
├─sdb8 vfat         D1D9-7AED                            
└─sdb9 swap         57037336-53c7-42dc-b55b-85a28a218e44                                                    
sr0                                                      
root@debian:~# 
~~~


## Segundo esquema.
- Disco duro: 1 GB
- Partición primaria: 200 MB
- Partición primaria: 100 MB
- Hueco: 500 MB
- Partición extendida.

Ejecutamos **fdisk** indicando el disco que queremos formatear.
~~~
root@debian:~# fdisk /dev/sdc

Bienvenido a fdisk (util-linux 2.29.2).
Los cambios solo permanecerán en la memoria, hasta que decida escribirlos.
Tenga cuidado antes de utilizar la orden de escritura.

El dispositivo no contiene una tabla de particiones reconocida.
Se ha creado una nueva etiqueta de disco DOS con el identificador de disco 0xea6ca7f6.

Orden (m para obtener ayuda): 
~~~


Creación de las distintas particiones primarias.
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
Disco /dev/sdc: 1 GiB, 1073741824 bytes, 2097152 sectores
Unidades: sectores de 1 * 512 = 512 bytes
Tamaño de sector (lógico/físico): 512 bytes / 512 bytes
Tamaño de E/S (mínimo/óptimo): 512 bytes / 512 bytes
Tipo de etiqueta de disco: dos
Identificador del disco: 0xea6ca7f6

Disposit.  Inicio Comienzo  Final Sectores Tamaño Id Tipo
/dev/sdc1             2048 411647   409600   200M 83 Linux
/dev/sdc2           411648 616447   204800   100M 83 Linux

Orden (m para obtener ayuda): w
Se ha modificado la tabla de particiones.
Llamando a ioctl() para volver a leer la tabla de particiones.
Se están sincronizando los discos.

root@debian:~# 
~~~


Creación de la partición swap.
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
Tipo de partición (teclee L para ver todos los tipos): l

 0  Vacía           24  DOS de NEC      81  Minix / Linux a bf  Solaris        
 1  FAT12           27  NTFS de WinRE o 82  Linux swap / So c1  DRDOS/sec (FAT-
 2  XENIX root      39  Plan 9          83  Linux           c4  DRDOS/sec (FAT-
 3  XENIX usr       3c  PartitionMagic  84  OS/2 oculto o h c6  DRDOS/sec (FAT-
 4  FAT16 <32M      40  Venix 80286     85  Linux extendida c7  Syrinx         
 5  Extendida       41  PPC PReP Boot   86  Conjunto de vol da  Datos sin SF   
 6  FAT16           42  SFS             87  Conjunto de vol db  CP/M / CTOS / .
 7  HPFS/NTFS/exFAT 4d  QNX4.x          88  Linux plaintext de  Utilidad Dell  
 8  AIX             4e  QNX4.x segunda  8e  Linux LVM       df  BootIt         
 9  AIX arrancable  4f  QNX4.x tercera  93  Amoeba          e1  DOS access     
 a  Gestor de arran 50  OnTrack DM      94  Amoeba BBT      e3  DOS R/O        
 b  W95 FAT32       51  OnTrack DM6 Aux 9f  BSD/OS          e4  SpeedStor      
 c  W95 FAT32 (LBA) 52  CP/M            a0  Hibernación de  ea  alineamiento Ru
 e  W95 FAT16 (LBA) 53  OnTrack DM6 Aux a5  FreeBSD         eb  BeOS fs        
 f  W95 Ext'd (LBA) 54  OnTrackDM6      a6  OpenBSD         ee  GPT            
10  OPUS            55  EZ-Drive        a7  NeXTSTEP        ef  EFI (FAT-12/16/
11  FAT12 oculta    56  Golden Bow      a8  UFS de Darwin   f0  inicio Linux/PA
12  Compaq diagnost 5c  Priam Edisk     a9  NetBSD          f1  SpeedStor      
14  FAT16 oculta <3 61  SpeedStor       ab  arranque de Dar f4  SpeedStor      
16  FAT16 oculta    63  GNU HURD o SysV af  HFS / HFS+      f2  DOS secondary  
17  HPFS/NTFS ocult 64  Novell Netware  b7  BSDI fs         fb  VMFS de VMware 
18  SmartSleep de A 65  Novell Netware  b8  BSDI swap       fc  VMKCORE de VMwa
1b  FAT32 de W95 oc 70  DiskSecure Mult bb  Boot Wizard hid fd  Linux raid auto
1c  FAT32 de W95 (L 75  PC/IX           bc  Acronis FAT32 L fe  LANstep        
1e  FAT16 de W95 (L 80  Minix antiguo   be  arranque de Sol ff  BBT            
Tipo de partición (teclee L para ver todos los tipos): 82

Se ha cambiado el tipo de la partición 'Extended' a 'Linux swap / Solaris'.

Orden (m para obtener ayuda): p
Disco /dev/sdc: 1 GiB, 1073741824 bytes, 2097152 sectores
Unidades: sectores de 1 * 512 = 512 bytes
Tamaño de sector (lógico/físico): 512 bytes / 512 bytes
Tamaño de E/S (mínimo/óptimo): 512 bytes / 512 bytes
Tipo de etiqueta de disco: dos
Identificador del disco: 0xea6ca7f6

Disposit.  Inicio Comienzo   Final Sectores Tamaño Id Tipo
/dev/sdc1             2048  411647   409600   200M 83 Linux
/dev/sdc2           411648  616447   204800   100M 83 Linux
/dev/sdc3          1640448 2097151   456704   223M 82 Linux swap / Solaris

Orden (m para obtener ayuda): w
Se ha modificado la tabla de particiones.
Llamando a ioctl() para volver a leer la tabla de particiones.
Se están sincronizando los discos.

root@debian:~# 
~~~


Formateo de las particiones.
~~~
root@debian:~# mkfs.ext4 /dev/sdc1
mke2fs 1.43.4 (31-Jan-2017)
Se está creando un sistema de ficheros con 204800 bloques de 1k y 51200 nodos-i
UUID del sistema de ficheros: ac19ca13-5d3d-432f-8320-7e2a94a1e026
Respaldo del superbloque guardado en los bloques: 
	8193, 24577, 40961, 57345, 73729

Reservando las tablas de grupo: hecho                           
Escribiendo las tablas de nodos-i: hecho                           
Creando el fichero de transacciones (4096 bloques): hecho
Escribiendo superbloques y la información contable del sistema de ficheros: hecho

root@debian:~# mkfs.ext4 /dev/sdc2
mke2fs 1.43.4 (31-Jan-2017)
Se está creando un sistema de ficheros con 102400 bloques de 1k y 25688 nodos-i
UUID del sistema de ficheros: c63561a6-ae76-48bd-b4d7-0c74fd480373
Respaldo del superbloque guardado en los bloques: 
	8193, 24577, 40961, 57345, 73729

Reservando las tablas de grupo: hecho                           
Escribiendo las tablas de nodos-i: hecho                           
Creando el fichero de transacciones (4096 bloques): hecho
Escribiendo superbloques y la información contable del sistema de ficheros: hecho

root@debian:~# mkswap /dev/sdc3
Configurando espacio de intercambio versión 1, tamaño = 223 MiB (233828352 bytes)
sin etiqueta, UUID=a520fd3d-50e9-43d2-b548-c91e91093f3b
root@debian:~# lsblk -f
NAME   FSTYPE LABEL UUID                                 MOUNTPOINT
sda                                                      
├─sda1 ext4         9bb748be-c081-4450-8a0e-51903495fc92 /
├─sda2                                                   
└─sda5 swap         bff0697e-82c1-4182-bd1c-cac74dd0e016 [SWAP]
sdb                                                      
├─sdb1 ext4         8f286382-7d21-4bfe-bad7-3892ae70f074 
├─sdb2                                                   
├─sdb5 ext4         bebf8bb5-ce05-45ab-9ced-f5f6eade1c23 
├─sdb6 ext4         e1f4a759-7d3f-4322-8728-acca96b31d5f 
├─sdb7 ntfs         0D8AADC91FEF15E1                     
├─sdb8 vfat         D1D9-7AED                            
└─sdb9 swap         57037336-53c7-42dc-b55b-85a28a218e44    
sdc                                                      
├─sdc1 ext4         5a534de5-96d1-4a5a-ad5e-2beff77db144 
├─sdc2 ext4         caad7d21-c43c-4c24-9a36-171435356ef1 
└─sdc3 swap         363332a4-15c6-4e12-a10e-fe4439ad65eb                                             
sr0                                                      
root@debian:~# 
~~~


# Particionado con gdisk.


Creación de un esquema de particionado utilizando la herramienta **gdisk**.


## Esquema.
- Disco duro: 1 GB.
- Partición Primaria: 150 MB, Tipo Linux.
- Partición Lógica: Tipo Linux
- Partición Lógica: Tipo Linux
- Partición Lógica: Tipo ntfs
- Partición Lógica: Tipo FAT32
- Partición Lógica: Tipo swap.


Ejecución de **gdisk** indicando el disco a formatear.
~~~
root@debian:~# gdisk /dev/sdb
GPT fdisk (gdisk) version 1.0.1

Partition table scan:
  MBR: MBR only
  BSD: not present
  APM: not present
  GPT: not present


***************************************************************
Found invalid GPT and valid MBR; converting MBR to GPT format
in memory. THIS OPERATION IS POTENTIALLY DESTRUCTIVE! Exit by
typing 'q' if you don't want to convert your MBR partitions
to GPT format!
***************************************************************


Command (? for help):
~~~


Creación de las distintas particiones.
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
Hex code or GUID (L to show codes, Enter = 8300): l
0700 Microsoft basic data  0c01 Microsoft reserved    2700 Windows RE          
3000 ONIE boot             3001 ONIE config           3900 Plan 9              
4100 PowerPC PReP boot     4200 Windows LDM data      4201 Windows LDM metadata
4202 Windows Storage Spac  7501 IBM GPFS              7f00 ChromeOS kernel     
7f01 ChromeOS root         7f02 ChromeOS reserved     8200 Linux swap          
8300 Linux filesystem      8301 Linux reserved        8302 Linux /home         
8303 Linux x86 root (/)    8304 Linux x86-64 root (/  8305 Linux ARM64 root (/)
8306 Linux /srv            8307 Linux ARM32 root (/)  8400 Intel Rapid Start   
8e00 Linux LVM             a500 FreeBSD disklabel     a501 FreeBSD boot        
a502 FreeBSD swap          a503 FreeBSD UFS           a504 FreeBSD ZFS         
a505 FreeBSD Vinum/RAID    a580 Midnight BSD data     a581 Midnight BSD boot   
a582 Midnight BSD swap     a583 Midnight BSD UFS      a584 Midnight BSD ZFS    
a585 Midnight BSD Vinum    a600 OpenBSD disklabel     a800 Apple UFS           
a901 NetBSD swap           a902 NetBSD FFS            a903 NetBSD LFS          
a904 NetBSD concatenated   a905 NetBSD encrypted      a906 NetBSD RAID         
ab00 Recovery HD           af00 Apple HFS/HFS+        af01 Apple RAID          
af02 Apple RAID offline    af03 Apple label           af04 AppleTV recovery    
af05 Apple Core Storage    bc00 Acronis Secure Zone   be00 Solaris boot        
bf00 Solaris root          bf01 Solaris /usr & Mac Z  bf02 Solaris swap        
bf03 Solaris backup        bf04 Solaris /var          bf05 Solaris /home       
bf06 Solaris alternate se  bf07 Solaris Reserved 1    bf08 Solaris Reserved 2  
Press the <Enter> key to see more codes:
bf09 Solaris Reserved 3    bf0a Solaris Reserved 4    bf0b Solaris Reserved 5  
c001 HP-UX data            c002 HP-UX service         ea00 Freedesktop $BOOT   
eb00 Haiku BFS             ed00 Sony system partitio  ed01 Lenovo system partit
ef00 EFI System            ef01 MBR partition scheme  ef02 BIOS boot partition 
f800 Ceph OSD              f801 Ceph dm-crypt OSD     f802 Ceph journal        
f803 Ceph dm-crypt journa  f804 Ceph disk in creatio  f805 Ceph dm-crypt disk i
fb00 VMWare VMFS           fb01 VMWare reserved       fc00 VMWare kcore crash p
fd00 Linux RAID            
Hex code or GUID (L to show codes, Enter = 8300): 4202
Changed type of partition to 'Windows Storage Spaces'

Command (? for help): n
Partition number (5-128, default 5): 
First sector (34-2097118, default = 1384448) or {+-}size{KMGTP}: 
Last sector (1384448-2097118, default = 2097118) or {+-}size{KMGTP}: +175M
Current type is 'Linux filesystem'
Hex code or GUID (L to show codes, Enter = 8300): l
0700 Microsoft basic data  0c01 Microsoft reserved    2700 Windows RE          
3000 ONIE boot             3001 ONIE config           3900 Plan 9              
4100 PowerPC PReP boot     4200 Windows LDM data      4201 Windows LDM metadata
4202 Windows Storage Spac  7501 IBM GPFS              7f00 ChromeOS kernel     
7f01 ChromeOS root         7f02 ChromeOS reserved     8200 Linux swap          
8300 Linux filesystem      8301 Linux reserved        8302 Linux /home         
8303 Linux x86 root (/)    8304 Linux x86-64 root (/  8305 Linux ARM64 root (/)
8306 Linux /srv            8307 Linux ARM32 root (/)  8400 Intel Rapid Start   
8e00 Linux LVM             a500 FreeBSD disklabel     a501 FreeBSD boot        
a502 FreeBSD swap          a503 FreeBSD UFS           a504 FreeBSD ZFS         
a505 FreeBSD Vinum/RAID    a580 Midnight BSD data     a581 Midnight BSD boot   
a582 Midnight BSD swap     a583 Midnight BSD UFS      a584 Midnight BSD ZFS    
a585 Midnight BSD Vinum    a600 OpenBSD disklabel     a800 Apple UFS           
a901 NetBSD swap           a902 NetBSD FFS            a903 NetBSD LFS          
a904 NetBSD concatenated   a905 NetBSD encrypted      a906 NetBSD RAID         
ab00 Recovery HD           af00 Apple HFS/HFS+        af01 Apple RAID          
af02 Apple RAID offline    af03 Apple label           af04 AppleTV recovery    
af05 Apple Core Storage    bc00 Acronis Secure Zone   be00 Solaris boot        
bf00 Solaris root          bf01 Solaris /usr & Mac Z  bf02 Solaris swap        
bf03 Solaris backup        bf04 Solaris /var          bf05 Solaris /home       
bf06 Solaris alternate se  bf07 Solaris Reserved 1    bf08 Solaris Reserved 2  
Press the <Enter> key to see more codes:
bf09 Solaris Reserved 3    bf0a Solaris Reserved 4    bf0b Solaris Reserved 5  
c001 HP-UX data            c002 HP-UX service         ea00 Freedesktop $BOOT   
eb00 Haiku BFS             ed00 Sony system partitio  ed01 Lenovo system partit
ef00 EFI System            ef01 MBR partition scheme  ef02 BIOS boot partition 
f800 Ceph OSD              f801 Ceph dm-crypt OSD     f802 Ceph journal        
f803 Ceph dm-crypt journa  f804 Ceph disk in creatio  f805 Ceph dm-crypt disk i
fb00 VMWare VMFS           fb01 VMWare reserved       fc00 VMWare kcore crash p
fd00 Linux RAID            
Hex code or GUID (L to show codes, Enter = 8300): 4202
Changed type of partition to 'Windows Storage Spaces'

Command (? for help): n
Partition number (6-128, default 6): 
First sector (34-2097118, default = 1742848) or {+-}size{KMGTP}: 
Last sector (1742848-2097118, default = 2097118) or {+-}size{KMGTP}: 
Current type is 'Linux filesystem'
Hex code or GUID (L to show codes, Enter = 8300): l
0700 Microsoft basic data  0c01 Microsoft reserved    2700 Windows RE          
3000 ONIE boot             3001 ONIE config           3900 Plan 9              
4100 PowerPC PReP boot     4200 Windows LDM data      4201 Windows LDM metadata
4202 Windows Storage Spac  7501 IBM GPFS              7f00 ChromeOS kernel     
7f01 ChromeOS root         7f02 ChromeOS reserved     8200 Linux swap          
8300 Linux filesystem      8301 Linux reserved        8302 Linux /home         
8303 Linux x86 root (/)    8304 Linux x86-64 root (/  8305 Linux ARM64 root (/)
8306 Linux /srv            8307 Linux ARM32 root (/)  8400 Intel Rapid Start   
8e00 Linux LVM             a500 FreeBSD disklabel     a501 FreeBSD boot        
a502 FreeBSD swap          a503 FreeBSD UFS           a504 FreeBSD ZFS         
a505 FreeBSD Vinum/RAID    a580 Midnight BSD data     a581 Midnight BSD boot   
a582 Midnight BSD swap     a583 Midnight BSD UFS      a584 Midnight BSD ZFS    
a585 Midnight BSD Vinum    a600 OpenBSD disklabel     a800 Apple UFS           
a901 NetBSD swap           a902 NetBSD FFS            a903 NetBSD LFS          
a904 NetBSD concatenated   a905 NetBSD encrypted      a906 NetBSD RAID         
ab00 Recovery HD           af00 Apple HFS/HFS+        af01 Apple RAID          
af02 Apple RAID offline    af03 Apple label           af04 AppleTV recovery    
af05 Apple Core Storage    bc00 Acronis Secure Zone   be00 Solaris boot        
bf00 Solaris root          bf01 Solaris /usr & Mac Z  bf02 Solaris swap        
bf03 Solaris backup        bf04 Solaris /var          bf05 Solaris /home       
bf06 Solaris alternate se  bf07 Solaris Reserved 1    bf08 Solaris Reserved 2  
Press the <Enter> key to see more codes: 
bf09 Solaris Reserved 3    bf0a Solaris Reserved 4    bf0b Solaris Reserved 5  
c001 HP-UX data            c002 HP-UX service         ea00 Freedesktop $BOOT   
eb00 Haiku BFS             ed00 Sony system partitio  ed01 Lenovo system partit
ef00 EFI System            ef01 MBR partition scheme  ef02 BIOS boot partition 
f800 Ceph OSD              f801 Ceph dm-crypt OSD     f802 Ceph journal        
f803 Ceph dm-crypt journa  f804 Ceph disk in creatio  f805 Ceph dm-crypt disk i
fb00 VMWare VMFS           fb01 VMWare reserved       fc00 VMWare kcore crash p
fd00 Linux RAID            
Hex code or GUID (L to show codes, Enter = 8300): 8200
Changed type of partition to 'Linux swap'

Command (? for help): p
Disk /dev/sdb: 2097152 sectors, 1024.0 MiB
Logical sector size: 512 bytes
Disk identifier (GUID): ED53A550-E33F-41F8-B5DB-7742A3D368AB
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

Do you want to proceed? (Y/N): Y
OK; writing new GUID partition table (GPT) to /dev/sdb.
The operation has completed successfully.
root@debian:~# 
~~~


Formateo de las particiones.
~~~
root@debian:~# mkfs.ext4 /dev/sdb1
mke2fs 1.43.4 (31-Jan-2017)
Se está creando un sistema de ficheros con 179200 bloques de 1k y 44880 nodos-i
UUID del sistema de ficheros: b8507a78-bd46-4ecf-b4de-779dd17c0107
Respaldo del superbloque guardado en los bloques: 
	8193, 24577, 40961, 57345, 73729

Reservando las tablas de grupo: hecho                           
Escribiendo las tablas de nodos-i: hecho                           
Creando el fichero de transacciones (4096 bloques): hecho
Escribiendo superbloques y la información contable del sistema de ficheros: hecho

root@debian:~# mkfs.ext4 /dev/sdb2
mke2fs 1.43.4 (31-Jan-2017)
Se está creando un sistema de ficheros con 179200 bloques de 1k y 44880 nodos-i
UUID del sistema de ficheros: b8507a78-bd46-4ecf-b4de-779dd17c0107
Respaldo del superbloque guardado en los bloques: 
	8193, 24577, 40961, 57345, 73729

Reservando las tablas de grupo: hecho                           
Escribiendo las tablas de nodos-i: hecho                           
Creando el fichero de transacciones (4096 bloques): hecho
Escribiendo superbloques y la información contable del sistema de ficheros: hecho

root@debian:~# mkfs.ext4 /dev/sdb3
mke2fs 1.43.4 (31-Jan-2017)
Se está creando un sistema de ficheros con 179200 bloques de 1k y 44880 nodos-i
UUID del sistema de ficheros: b8507a78-bd46-4ecf-b4de-779dd17c0107
Respaldo del superbloque guardado en los bloques: 
	8193, 24577, 40961, 57345, 73729

Reservando las tablas de grupo: hecho                           
Escribiendo las tablas de nodos-i: hecho                           
Creando el fichero de transacciones (4096 bloques): hecho
Escribiendo superbloques y la información contable del sistema de ficheros: hecho

root@debian:~# mkfs.ntfs /dev/sdb4
Cluster size has been automatically set to 4096 bytes.
Initializing device with zeroes: 100% - Done.
Creating NTFS volume structures.
mkntfs completed successfully. Have a nice day.
root@debian:~# mkfs.vfat /dev/sdb5
mkfs.fat 4.1 (2017-01-24)
root@debian:~# mkswap /dev/sdc6
Configurando espacio de intercambio versión 1, tamaño = 173 MiB (181379072 bytes)
sin etiqueta, UUID=74397183-f710-4b34-aeb2-b09607ac1aaf
root@debian:~# lsblk -f
NAME   FSTYPE LABEL UUID                                 MOUNTPOINT
sda                                                      
├─sda1 ext4         9bb748be-c081-4450-8a0e-51903495fc92 /
├─sda2                                                   
└─sda5 swap         bff0697e-82c1-4182-bd1c-cac74dd0e016 [SWAP]
sdb                                                      
├─sdb1 ext4         5a534de5-96d1-4a5a-ad5e-2beff77db144 
├─sdb2 ext4         b8507a78-bd46-4ecf-b4de-779dd17c0107 
├─sdb3 ext4         723aa6f8-52b4-46f0-8b8f-7983eed84e4d 
├─sdb4 ntfs         06BE8632672E9D7C                     
├─sdb5 vfat         7AB0-88EB                            
└─sdb6 swap         74397183-f710-4b34-aeb2-b09607ac1aaf 
sr0                                                      
root@debian:~# 
~~~
