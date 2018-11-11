library(data.table)
main_folder = "You dir here."
setwd(main_folder)
list.files()
setwd(".\\test")
list.files()      
x_test = fread("X_test.txt")
y_test = fread('y_test.txt')
setwd(main_folder)
setwd(".\\train")
list.files()
x_train = fread("X_train.txt")
y_train = fread('y_train.txt')
#creating X

#I will use rbind because the cols seem to match up
X = rbind(x_test, x_train)
dim(X)
setwd(main_folder)
list.files()
features = fread('features.txt')
#I am using a feature vector to add names to the cols in the data frame
colnames(X) = features$V2
dim(features)
#creating Y
dim(y_test)
dim(y_train)
Y = rbind(y_test,y_train)
names(Y)
nrow(Y)
ID = 1:nrow(Y)
#Lets look at y
Y = cbind(ID, Y)
dim(Y)
colnames(Y) = c("ID", "activities")
names(X)
names(Y)
one_data = cbind(Y,X)
dim(one_data)
names(one_data)
head(one_data$activities)
setwd(main_folder)
labels = fread("activity_labels.txt")
labels
count = 0
#rename all of the activities data via activity_labels.txt
one_data$activities = gsub(labels$V1[1], labels$V2[1],one_data$activities)
one_data$activities = gsub(labels$V1[2], labels$V2[2],one_data$activities)
one_data$activities = gsub(labels$V1[3], labels$V2[3],one_data$activities)
one_data$activities = gsub(labels$V1[4], labels$V2[4],one_data$activities)
one_data$activities = gsub(labels$V1[5], labels$V2[5],one_data$activities)
one_data$activities = gsub(labels$V1[6], labels$V2[6],one_data$activities)
ID = one_data$ID
act = one_data$activities
mean = grep("*mean", names(one_data))
std = grep("*std", names(one_data))
index = c(1, 2,mean, std)
index = sort(index)
ilength(index)
#Lets apply the index vetor to subset our data
one_data[ ,..index]
one_data
final_df = one_data[ ,..index]
dim(final_df)
#Now, lets look at the variable names
names(final_df)
head(final_df$act)

write.csv(final_df, file = "final.csv")
list.files()
write.table(final_df, "tidy_table_miles_lilly.txt", sep=",",row.names = FALSE)

