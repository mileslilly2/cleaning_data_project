library(data.table)
main_folder = "Put the dir of your data here."
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
#Lets look at y
dim(Y)
colnames(Y) = 'Output'
names(X)
names(Y)
one_data = cbind(X,Y)
dim(one_data)
names(one_data)
str(one_data)

mean = grep("*mean", names(one_data))
std = grep("*std", names(one_data))
index = c(mean, std)
index = sort(index)
length(index)
#Lets apply the index vetor to subset our data
one_data[ ,..index]
final_df = one_data[ ,..index]
dim(final_df)
#Now, lets look at the variable names
names(final_df)

write.csv(final_df, file = "final.csv")
list.files()
write.table(final_df, "tidy_table_miles_lilly.txt", sep=",",row.names = FALSE)
