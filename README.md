# MediaWiki-Vagrant-CentOS
## Descripcion:


Aqui enseño como levantar una caja vagrant CentOS 7 Que instale automaticamente LAMP y ademas MediaWiki, lista para configurar desde el navegador.


### Pasos para su instalacion:

##### 1. Partimos de la base de que ya tienes instalado Vagrant, si no es asi descarga el archivo de como isntalar vagrant que dejo arriba:

##### 2. Creamos una carpeta para nuestra caja de centos y entramos:
   * mkdir centos_prueba (el nombre poner el que querais)
   * cd centos_prueba
   
##### 3. Ejecutamos los siguientes comandos para descargar la caja:
   * vagrant add box centos/7 https://app.vagrantup.com/centos/boxes/7
   * vagrant init
   
##### 4. Se nos crea un archivo Vagranfile, el cual editamos con nano o vi como ustedes querais e introducimos los siguiente en el:
   * config.vm.box ="centos/7"
   * config.vm.network "forwarded_port", guest: 80, host: 8080
   * config.vm.network "public_network", :bridged=>"Vuestra tarjeta de red"
   * config.vm.provision :shell,path:"LAMP_MEDIAWIKI.sh"
   
##### 5. Ahora descarga el scrip .sh que dejo arriba en el repositorio para automatixar toda la instalacion, mirad como esta hecho para entenderlo y hacer las modificaciones que necesiteis. Metedlo en la carpeta centos_prueba y ejecutar el siguiente comando:
   * vagrant up
   
##### 6. Ya estaria todo listo por lo que podemos entrar con vagrant ssh y mirar la ip para conectarnos al servidor y configurar mediawiki.
 
 #Enlaces:
 >Aqui os dejo un video de como se hace en mi canal de youtube [Enlace al video](https://www.youtube.com/watch?v=YLBoRdCtbSY&feature=youtu.be)
  
