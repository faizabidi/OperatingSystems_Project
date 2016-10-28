from pyspark import SparkContext
from pyspark.mllib.classification import LogisticRegressionWithLBFGS, LogisticRegressionModel
from pyspark.mllib.regression import LabeledPoint
from datetime import datetime
from pyspark.mllib.evaluation import MulticlassMetrics

from numpy import array
from math import sqrt

from pyspark.mllib.clustering import KMeans, KMeansModel

# Load and parse the data
sc = SparkContext ("local", "http://archive.ics.uci.edu - Single Node")
data = sc.textFile("/home/faiz89/git/OperatingSystems_Project/sat.tst")
parsedData = data.map(lambda line: array([float(x) for x in line.split(' ')]))

# Build the model (cluster the data)
clusters = KMeans.train(parsedData, 10, maxIterations=10000,
                        runs=10000, initializationMode="random")

# Evaluate clustering by computing Within Set Sum of Squared Errors
def error(point):
    center = clusters.centers[clusters.predict(point)]
    return sqrt(sum([x**2 for x in (point - center)]))

WSSSE = parsedData.map(lambda point: error(point)).reduce(lambda x, y: x + y)
print("Within Set Sum of Squared Error = " + str(WSSSE))

# Save and load model
clusters.save(sc, "/home/faiz89/git/OperatingSystems_Project/KMeansModel")
sameModel = KMeansModel.load(sc, "/home/faiz89/git/OperatingSystems_Project/KMeansModel")
