# Usa la imagen base de Miniconda3
FROM continuumio/miniconda3

# Etiqueta de información sobre el mantenimiento del archivo
LABEL maintainer="Julian Morales <juliancmorales10@gmail.com>"

# Instala Jupyter Notebook
RUN conda install -y jupyter && \
    conda clean -afy && \
    conda update -y conda && \
    conda update -y --all

# Crea directorios para datasets y notebooks
RUN mkdir /opt/notebooks && \
    mkdir /opt/datasets

# Establece el directorio de trabajo para notebooks
WORKDIR /opt/notebooks

# Copia el contenido local al contenedor en el directorio de trabajo de notebooks
COPY . /opt/notebooks

# Expone el puerto 8888 para acceder a Jupyter Notebook
EXPOSE 8888

# Comando para ejecutar Jupyter Notebook
CMD ["/opt/conda/bin/jupyter", "notebook", "--notebook-dir=/opt/notebooks", "--ip='*'", "--port=8888", "--no-browser", "--allow-root"]

# Crear imagen contenedor
# docker build -t anaconda_image .

# Crear contenedor
# docker run -it -p 8888:8888 --name anaconda_jupyter_server anaconda_image

# Ingresar al contendor
# docker exec -it anaconda_jupyter_server /bin/bash

# Iniciar contenedor
# docker start anaconda_jupyter_server
