# dswpython-2021
Repozytorium przedmiotu Data Science w Pythonie

## Zawartość repozytorium

Zawartość poszczególnych folderów:

* /data - przykładowe dane do zadań 
* /docs - teksty i prezentacje do wykładów i ćwiczeń
* /src - kod źródłowy do zadań

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

Ostatnim krokiem jest ustawienie zmiennej środowiskowej `HADOOP_HOME`, by wskazywała na ten sam katalog co `SPARK_HOME`.


#### Linux / MacOS

W linuxowych środowiskach dodać do pliku ~/.bashrc albo ~/.zshrc (zależnie od stosowanego shella):

```shell script
export SPARK_HOME=~/bin/spark-2.4.4-bin-hadoop2.7
export PATH="$SPARK_HOME/bin:$PATH"
```

### Uruchamianie Sparka w środowisku Jupyter Notebook

Apache Spark bardzo dobrze integruje się ze środowiskiem Jupyter Notebook.

#### Konfiguracja zmiennych środowiskowych

Konfiguracja i uruchomienie pysparka:
```bash shell
export PYSPARK_DRIVER_PYTHON="jupyter" 
export PYSPARK_DRIVER_PYTHON_OPTS="notebook" 

$SPARK_HOME/bin/pyspark
```

lub pod Windows:
```bash shell
set PYSPARK_DRIVER_PYTHON="jupyter" 
set PYSPARK_DRIVER_PYTHON_OPTS="notebook" 

%SPARK_HOME%\bin\pyspark
```

Od tej chwili w notatniku w Kernelu Python3 będzie dostępna zmienna `spark`, reprezentująca obiekt SparkSession.

Użycie w notatniku:
```python
df = spark.createDataFrame(...)
```

#### Pakiet findspark

Możliwe jest również użycie pakietu findspark, który ustawi referencje do zainstalowanego w systemie pysparka.
W tym przypadku nie potrzeba nic ustawiać, jedynie wskazać na katalog domowy Sparka, czyli zazwyczaj ten, do którego go rozpakowaliśmy na swoim domowym komputerze.

Instalacja:
```bash shell
pip install findspark
```

Użycie w notatniku:
```python
import findspark
findspark.init()                 # gdy zmienna SPARK_HOME jest ustawiona w systemie
findspark.init(SPARK_HOME_PATH)  # gdy zmienna SPARK_HOME nie jest ustawiona w systemie

from pyspark.sql import SparkSession
spark = SparkSession.builder.appName("DataScience").getOrCreate()
```
