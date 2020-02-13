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
