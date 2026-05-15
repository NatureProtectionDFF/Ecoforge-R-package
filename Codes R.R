#Eliminar los archivos de la carpeta docs del repositorio
unlink("docs", recursive = TRUE)

#Instalar las funciones creadas en el repositorio en la carpeta R/
library(devtools)
install_github("https://github.com/NatureProtectionDFF/Ecoforge-R-package")
library(ecoforge)

#Instalar paquete que permite visualizar las funciones creadas y su descripción en la web
install.packages("pkgdown")
library(pkg)
pkgdown::build_site()

#Cargar el paquete que permita crear un archivo NAMESPACE para poder descargar las funciones
# Lista todos los archivos .R
archivos <- list.files("R/", pattern = "\\.R$", full.names = TRUE)

# Muestra el nombre de la función en cada archivo
for (f in archivos) {
  lineas <- readLines(f)
  funcion <- lineas[grep("<- function", lineas)]
  cat(f, ":", funcion[1], "\n")
}