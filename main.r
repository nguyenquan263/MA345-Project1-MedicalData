medicalRecords <- read.csv("MedicalData.csv")
numberMedicalRecords <- length(medicalRecords$ID.Number)

View(medicalRecords)

#boxplot for attributes
boxplot(medicalRecords$Age, horizontal = TRUE)
boxplot(medicalRecords$Weight..Pounds., horizontal = TRUE)
boxplot(medicalRecords$Total.Cholestrol.Level..mg.dL., horizontal = TRUE)
boxplot(medicalRecords$Systolic.Blood.Pressure..mmHg., horizontal = TRUE)



#Cholesterol Level attribute
cholesterolLevel <- vector()

for (i in 1:numberMedicalRecords) {
  currentWeight <- medicalRecords$Weight..Pounds.[i]
  if (currentWeight < 200) {
    cholesterolLevel <- c(cholesterolLevel, "Good")
  } else if (currentWeight < 240) {
    cholesterolLevel <- c(cholesterolLevel, "Borderline")
  } else {
    cholesterolLevel <- c(cholesterolLevel, "High")
  }
}

medicalRecords <- cbind(medicalRecords, cholesterolLevel)

View(medicalRecords)

#Blood Pressure attribute
bloodPressure <- vector()

for (i in 1:numberMedicalRecords) {
  currentBloodPressureMMHG <- medicalRecords$Systolic.Blood.Pressure..mmHg.[i]
  
  if (currentBloodPressureMMHG < 120) {
    bloodPressure <- c(bloodPressure, "Normal")
  } else if (currentBloodPressureMMHG < 130) {
    bloodPressure <- c(bloodPressure, "Elevated")
  } else if (currentBloodPressureMMHG < 140) {
    bloodPressure <- c(bloodPressure, "High Blood Pressure Stage 1")
  } else {
    bloodPressure <- c(bloodPressure, "High Blood Pressure Stage 2")
  }
}

medicalRecords <- cbind(medicalRecords, bloodPressure)
View(medicalRecords)

#Histogram Cholesterol Level respect to High Blood Pressure
install.packages("ggplot2")
library(ggplot2)
qplot(medicalRecords$Total.Cholestrol.Level..mg.dL., 
      geom = "histogram",
      main = "Histogram for Histogram Cholesterol Level grouped by High Blood Pressure",
      xlab = "Cholesterol Level")
