# Segmentación de granos de arroz utilizando clustering

Este reposoitorio posee un entorno de Python y un Jupyter Notebook que, trabajando con datos generados por Koklu, M. *et al* (2021) [[1]](#1)[[2]](#2)[[3]](#3)[[4]](#4), desarrolla distintos pasos para la segmentación de granos de arroz en imágenes, utilizando redes neuronales convolucionales para la generación de features y métodos de clustering para la deteccion de los distintos tipos de granos de arroz.  

El arroz, que se encuentra entre los cereales más producidos en todo el mundo, tiene muchas variedades genéticas. Estas variedades se diferencian entre sí por algunas de sus características. Suelen ser características como la textura, la forma y el color. Con estas características que distinguen a las variedades de arroz, es posible clasificar y evaluar la calidad de las semillas. En este estudio se utilizaron Arborio, Basmati, Ipsala, Jasmine y Karacadag, que son cinco variedades diferentes de arroz que a menudo se cultivan en Turquía. En el conjunto de datos se incluyen un total de 75.000 imágenes de granos, 15.000 de cada una de estas variedades.

## Armado de entorno de trabajo

### Clonar repositorio e instalar librerías

```python
git clone https://github.com/Ignacio-Ibarra/unsupervised-rice-image-segmentation.git

cd unsupervised-rice-image-segmentation

python3 -m venv <venv_name>

source venv_name/bin/activate

pip install --upgrade pip

pip install pandas matplotlib seaborn colour opencv-python ipykernel clustimage tensorflow
```

### Descarga de datos y creación de estructura del directorio
Descargar imágenes de granos de arroz de [aquí](https://www.muratkoklu.com/datasets/vtdhnd09.php). Descomprimir el archivo `*.zip` en una carpeta `input`, creando un directorio que posea la siguiente estructura: 

```
unsupervised-rice-image-segmentation
├── input
│   ├── Arborio # Especie de arroz
│   │   ├── Arborio (1).png
│   │   ├── Arborio (2).png
│   │   ├── Arborio (3).png
|   |   ...
│   │   └── Arborio (15000).png
│   └── Basmati
│   │   ├── Basmati (1).png
│   │   ├── Basmati (2).png
│   │   ├── Basmati (3).png
|   |   ...
│   │   └── Basmati (15000).png
|   ...
├── notebook.ipynb
└── requirements.txt
```

## Preparación de los datos (Notebook 1) - Nacho
* Levantar las imágenes y sus etiquetas. 
* Documentar las propiedades del dataset a utilizar. 
* Describir sus atributos, de forma semejante a lo realizado en el pre-informe. 
* Verificar que las imágenes sean comparables en color, valor, rango y tamaño.

## Generación de dataset de trabajo (Notebook 2 en Google Colab)
* Extracción de features utilizando `VGG16`, quedándose con la anteúltima capa fully-connected. Guardar salida

## Reducción de dimensionalidad (va como paso en la notebook propia )
* Reducción de dimensionalidad con PCA. (Esto lo podemos hacer todos)
* Guardado de dataset en Drive y compartirlo. 

## Clustering: kmeans++ (Martín), hclust (Juan), kmedoids (Nacho) (un notebook por cada uno)
* Aplicar KMeans sobre el conjuntos de datos (con distintas métricas, normalizaciones,
combinaciones, etc). Determinar la cantidad de clusters utilizando silhuette y SSE.
* Evaluar si el agrupamiento para el k óptimo se condice que las etiquetas de las imágenes
utilizando la matriz de confusión y los índices de Rand y Van Dongen en los casos que
correspondan.
* Visualizar los clusters y las etiquetas de género en baja dimensión con alguna técnica
de reducción (PCA, TSNE, MDS, etc).
* Analizar los resultados obtenidos.
* Repetir los pasos para al menos otros dos algoritmos de clustering. En el paso $a)$ considerar
los hiper-parámetros y la métrica de validación interna que corresponda. 

## Comparar (Notebook 4), input: para cada método tengo que tener label y cluster por cada imagen. 
* Comparar y discutir brevemente los resultados obtenidos.

## Detección de objetos dentro de una imagen [TODAVIA NO REPARTIMOS]
Se propone detectar un objeto dentro de una imágen siguiendo los siguientes pasos.
* Seleccionar una sóla imagen.
* Convertir la imagen a binaria.
* Aplicar los algoritmos de *Connected-component labelling* y *clustering espectral* sobre
los pixels.
* Describir el proceso y comparar los resultados obtenidos.

## Referencias
<a id="1">[1]</a> 
Koklu, M., Cinar, I., & Taspinar, Y. S. (2021). Classification of rice varieties with deep learning methods. Computers and Electronics in Agriculture, 187, 106285. https://doi.org/10.1016/j.compag.2021.106285

<a id="2">[2]</a> 
Cinar, I., & Koklu, M. (2021). Determination of Effective and Specific Physical Features of Rice Varieties by Computer Vision In Exterior Quality Inspection. Selcuk Journal of Agriculture and Food Sciences, 35(3), 229-243. https://doi.org/10.15316/SJAFS.2021.252

<a id="3">[3]</a> 
Cinar, I., & Koklu, M. (2022). Identification of Rice Varieties Using Machine Learning Algorithms. Journal of Agricultural Sciences https://doi.org/10.15832/ankutbd.862482

<a id="4">[4]</a> 
Cinar, I., & Koklu, M. (2019). Classification of Rice Varieties Using Artificial Intelligence Methods. International Journal of Intelligent Systems and Applications in Engineering, 7(3), 188-194. https://doi.org/10.18201/ijisae.2019355381

