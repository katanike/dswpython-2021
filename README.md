# dswpython-2021
Repozytorium przedmiotu Data Science w Pythonie

## Zawartość repozytorium

Zawartość poszczególnych folderów:

* /data - przykładowe dane do zadań 
* /docs - folder zawierający slajdy z zajęć oraz dodatkowe materiały w formacie PDF oraz graficznym
* /src - kod źródłowy do poszczególnych zadań

Obecna zawartość repozytorium jest tymczasowa i będzie uzupełniana w miarę rozwoju zajęć.


## Logowanie do AWS

Adres strony logowania:
[https://619731119112.signin.aws.amazon.com/console](https://619731119112.signin.aws.amazon.com/console)


## Apache Spark

### Instalacja Apache Spark w środowisku lokalnym

Pakiet Apache Spark można pobrać ze strony: http://spark.apache.org/downloads.html

Kroki instalacji dla wersji Apache Spark 3.1.1:
1. Ściągnąć paczkę: https://www.apache.org/dyn/closer.lua/spark/spark-3.1.1/spark-3.1.1-bin-hadoop2.7.tgz
2. Rozpakować ją przykładowo do katalogu ~/tools/spark-3.1.1-bin-hadoop2.7 lub c:/tools/spark-3.1.1-bin-hadoop2.7
3. Ustawić zmienną `SPARK_HOME`, by wskazywała na katalog ze Sparkiem.


#### Windows

W środowisku Windows potrzebne jest dodatkowe narzędzie `winutils.exe`, które dostarcza skompilowane biblioteki platformy Apache Hadoop.

Można je bezpośrednio ściągnąć z tego adresu:
https://github.com/steveloughran/winutils/blob/master/hadoop-2.6.3/bin/winutils.exe?raw=true

Program `winutils.exe` należy następnie skopiować do katalogu `bin`, który znajduje się w rozpakowanej paczce ze Sparkiem, czyli `%SPARK_HOME%\bin`.



#### Linux / MacOS

W linuxowych środowiskach dodać do pliku ~/.bashrc albo ~/.zshrc (zależnie od stosowanego shella):

```shell script
export SPARK_HOME=~/bin/spark-2.4.4-bin-hadoop2.7
export PYSPARK_DRIVER_PYTHON="jupyter" 
export PYSPARK_DRIVER_PYTHON_OPTS="notebook" 

export PATH="$SPARK_HOME/bin:$PATH"
```
