  #!/bin/bash  
  # SHC Install Script
  
  echo 'Este script necesita permisos de root, asegurate de tenerlos antes de ejecutarlo'
  echo 'Dime el numero de la ultima version de SHC (por ejemplo: 3.8.6). Puedes verificar cual es la ultima version entrando a http://www.datsi.fi.upm.es/~frosal/sources/'
  read shcversion
  startdir=(pwd)
  wget http://www.datsi.fi.upm.es/~frosal/sources/shc-$shcversion.tgz || ! echo 'Error al descargar las fuentes, saliendo...' | exit 2
  tar xfv shc-$shcversion.tgz  || ! echo 'Error al extraer las fuentes del tarball, saliendo...' | exit 3
  make  || ! echo 'Error al compilar, saliendo...' | exit 4
  install -D -s shc /usr/bin/shc  || ! echo 'Error al instalar, saliendo...' | exit 5
  install -D -m 644 shc.1 /usr/man/man1/shc.1  || ! echo 'Error al agregar pagina de man, saliendo...' | exit 6
  echo 'Instalacion exitosa, saliendo' | exit 0
