corr <- function (directorio, umbral=0)
{
  #1. Obtener todos los archivos
  #2. Obtener los casos, si es mayor a umbral
  #3. Añadir nitrato a un vector, sulfato a otro vector
  #4. Enviar la correlación
  archivos = list.files(directorio,full.names=TRUE)
  v_cor<-numeric()
  for (i in 1:length(archivos))
  {
    data<-data.frame()
    data<-read.csv(archivos[i])
    comp<-complete.cases(data)
    if (nrow(data[comp,])>umbral)
      v_cor<-c(v_cor,cor(data[comp,"sulfate"],data[comp,"nitrate"]))
  }
  v_cor    
}
