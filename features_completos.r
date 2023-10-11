# Este script utiliza como input
# 5 archivos que contienen los 4096 features generados por la red convolucional
# y un archivo que contiene los 6 features generados por connected 
# component labelling
# Devuelve un 5 archivos, uno por clase, que contienen 4102 features
# y dos columnas referidas a la clase y el nombre del archivo de la imagen. 


#limpio la memoria
rm( list=ls() )  #remove all objects
gc()             #garbage collection

require(data.table)

setwd("//wsl.localhost/Ubuntu/home/nachengue/fundar/python_projects/unsupervised-rice-image-segmentation")


input_folder <- "output/datasets/"
file_list <- list.files(input_folder, pattern = "^features_.*\\.csv$", full.names = TRUE)

X1 <- data.table()


for (path in file_list) {
  class_name <- gsub("features_", "", basename(path))
  class_name <- gsub(".csv", "", class_name)
  class_name <- tolower(class_name)
  print(class_name)
  
  header <- fread(path, header=T, nrow=1, sep=",")
  df <- fread(path, skip = 1, header=F)
  setnames(df, colnames(header))
  df[, image_id := paste0(class_name, " (", 1:nrow(df), ").jpg")]
  
  X1 <- rbindlist(list(X1, df))
}


X2 <- fread("./output/datasets/features_morfologicos.csv.gz")

completo <- merge(X1, X2, by="image_id")

clases <- unique(X2$class_name)

for (clase in clases){
  x <- completo[class_name==clase]
  filename <- sprintf("./output/datasets/features_completos_%s.csv.gz", clase)
  fwrite(x,filename, row.names = F)
  cat(clase, "listo\n")
}


