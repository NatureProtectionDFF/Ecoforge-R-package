#Eliminar los archivos de la carpeta docs del repositorio
unlink("docs", recursive = TRUE)

#Instalar las funciones creadas en el repositorio en la carpeta R/
library(devtools)
install_github("https://github.com/NatureProtectionDFF/Ecoforge-R-package")
library(ecoforge)

library(ecoforge)
ls("package:ecoforge")

#Instalar paquete que permite visualizar las funciones creadas y su descripción en la web
install.packages("pkgdown")
library(pkgdown)

install.packages("quarto")
library(quarto)
pkgdown::init_site()

# Activa rutas largas en R
Sys.setenv(R_MAX_PATH = 500)

pkgdown::build_reference()
list.files("docs/reference/")

#Cargar el paquete que permita crear un archivo NAMESPACE para poder descargar las funciones
# Lista todos los archivos .R
archivos <- list.files("R/", pattern = "\\.R$", full.names = TRUE)

# Muestra el nombre de la función en cada archivo
for (f in archivos) {
  lineas <- readLines(f)
  funcion <- lineas[grep("<- function", lineas)]
  cat(f, ":", funcion[1], "\n")
}

archivos_na <- c("R/countOcc.R", "R/generateClim.R", "R/generateMonthlyPrec.R",
                 "R/generateMonthlyTemp.R", "R/generatePoints.R", "R/generateVar.R",
                 "R/logistic.R", "R/scale01.R", "R/transectSample.R")

for (f in archivos_na) {
  cat("\n---", f, "---\n")
  cat(readLines(f), sep = "\n")
}


#Esto añade #' @export al principio de cada archivo .R que no lo tenga ya
archivos <- list.files("R/", pattern = "\\.R$", full.names = TRUE)

for (f in archivos) {
  contenido <- readLines(f, warn = FALSE)
  # Solo añadir si no tiene ya @export
  if (!any(grepl("@export", contenido))) {
    nuevo <- c("#' @export", contenido)
    writeLines(nuevo, f)
    cat("Actualizado:", f, "\n")
  } else {
    cat("Ya tiene @export:", f, "\n")
  }
}

# Instala roxygen2 si no lo tienes
install.packages("roxygen2")
library(roxygen2)

# Genera el NAMESPACE automáticamente
roxygen2::roxygenise()

file.exists("NAMESPACE")
readLines("NAMESPACE")

unlink("docs/index.html")

#Pero hay un detalle importante: cada vez que hagas quarto render 
#después de esto, Quarto no borrará la carpeta docs/reference/ 
#porque no la genera él, la genera pkgdown. Así que el flujo de 
#trabajo correcto de ahora en adelante será:
# 1. Primero Quarto genera la web [Codigo en Terminal]
quarto render

# 2. Luego pkgdown genera las páginas de funciones
library(pkgdown)
library(quarto)

pkgdown::init_site()
pkgdown::build_reference() # [Codigo en R]

# 3. Subir todo [Codigo en Terminal]
git add .
git commit -m "Update website"
git push



