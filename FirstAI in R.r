#This is the 3rd model of the FirstAI series, but reprogrammed in R.
#It's a basic skeleton that I'll fix later, but I've only just learnt R today.

train <- read_csv('/kaggle/input/titanic/train.csv')
test <- read_csv('/kaggle/input/titanic/test.csv')


train <- subset(train, select = -c('Name','SibSp','Parch', 'Ticket', 'Fare', 'Cabin', 'Embarked'),axis=1)
test <- subset(test, select = -c('Name','SibSp','Parch', 'Ticket', 'Fare', 'Cabin', 'Embarked'),axis=1)

train['Age'] = train[is.na('Age')] <- 0 
test['Age'] = test[is.na('Age')] <- 0 

features <- c('Pclass','Age','Sex_binary')
target <- 'Survived'

###
###

logreg <- glm(Survived ~.,family=binomial(link='logit'),data=train)


fitted.results <- predict(model,newdata=subset(test,select=c(2,3,4,5,6,7,8)),type='response')
fitted.results <- ifelse(fitted.results > 0.5,1,0)
misclasserror <- mean(fitted.results != test$Survived)
print(paste('Accuracy',1-misClasificError))

submission = pd.DataFrame({'PassengerId':test['PassengerId'],'Survived':logreg_predictions})
submission.to_csv('submission2.csv', index=False)
