# Segmentación de granos de arroz utilizando clustering

En este markdown se detallan los pasos seguidos para la segmentación de granos de arroz en imágenes.

## Armado de entorno
* Descarga de datos
* Armado de estructura de directorio
* Instalación de entorno virtual y creación de requirements.txt
* Creación de repositorio Git y creación de repositorio remoto, autorización de colaboradores. 

```
git clone https://github.com/Ignacio-Ibarra/unsupervised-rice-image-segmentation.git

cd unsupervised-rice-image-segmentation

python3 -m venv <venv_name>

source venv_name/bin/activate

pip install --upgrade pip

pip install -r requirements.txt
```

## Preparación de los datos
* Levantar las imágenes y sus etiquetas. 
* Documentar las propiedades del dataset a utilizar. 
* Describir sus atributos, de forma semejante a lo realizado en el pre-informe. 
* Verificar que las imágenes sean comparables en color, valor, rango y tamaño.

## Generación de dataset de trabajo
* Extracción de features utilizando `VGG16`, quedándose con la anteúltima capa fully-connected
* Reducción de dimensionalidad con PCA. 
* Guardado de dataset en Drive. 

## Clustering
* Aplicar KMeans sobre el conjuntos de datos (con distintas métricas, normalizaciones,
combinaciones, etc). Determinar la cantidad de clusters utilizando silhuette y SSE.
* Evaluar si el agrupamiento para el k óptimo se condice que las etiquetas de las imágenes
utilizando la matriz de confusión y los índices de Rand y Van Dongen en los casos que
correspondan.
* Visualizar los clusters y las etiquetas de género en baja dimensión con alguna técnica
de reducción (PCA, TSNE, MDS, etc).
* Analizar los resultados obtenidos.
* Repetir los pasos para al menos otros dos algoritmos de clustering. En el paso $a)$ considerar
los hiper-parámetros y la métrica de validación interna que corresponda. Comparar y
discutir brevemente los resultados obtenidos.

## Detección de objetos dentro de una imagen
Se propone detectar un objeto dentro de una imágen siguiendo los siguientes pasos.
* Seleccionar una sóla imagen.
* Convertir la imagen a binaria.
* Aplicar los algoritmos de *Connected-component labelling* y *clustering espectral* sobre
los pixels.
* Describir el proceso y comparar los resultados obtenidos.