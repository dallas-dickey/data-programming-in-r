##First we look at how teams total cap space effects there wins including a regression line

Total_regAll <- lm(formula = Win ~ Total_Cap , data = nflAllYears )

summary(Total_regAll)


ggplot() +
  geom_point(aes(x = nflAllYears$Total_Cap, y = nflAllYears$Win),
             colour = 'purple') +
  geom_line(aes(x = nflAllYears$Total_Cap, y = predict(Total_regAll, newdata = nflAllYears)),
            colour = 'blue') +
  ggtitle('Simple Linear Regression for Salary Cap and Wins') +
  xlab('Salary Cap') + 
  ylab('Number of Wins')+
  scale_x_continuous(labels=dollar)

##Wins per year of the 8 teams with the highest salary cap.


t1 <- subset(nflAllYears, nflAllYears$Team=='Cleveland Browns'|
               nflAllYears$Team=='San Francisco 49ers'|
               nflAllYears$Team=='Pittsburgh Steelers'|
               nflAllYears$Team=='New York Jets'|
               nflAllYears$Team=='New England Patriots'|
               nflAllYears$Team=='Indianapolis Colts'|
               nflAllYears$Team=='Arizona Cardinals'|
               nflAllYears$Team=='Tampa Bay Buccaneers')



t2 <- ggplot(t1, aes(x=Year, y=Win, group=Team)) +
  geom_line(aes(color=Team))+
  geom_point(aes(color=Team))+
  ggtitle('Teams With Highest Salary Cap') +
  xlab('Year') + 
  ylab('Number of Wins')

t2


##Total Wins per year for the teams with the highest dead space

d2 <- subset(nflAllYears, nflAllYears$Team=='Miami Dolphins'|
               nflAllYears$Team=='Cleveland Browns'|
               nflAllYears$Team=='New Orleans Saints'|
               nflAllYears$Team=='San Francisco 49ers'|
               nflAllYears$Team=='Arizona Cardinals'|
               nflAllYears$Team=='New York Giants'|
               nflAllYears$Team=='Chicago Bears'|
               nflAllYears$Team=='Buffalo Bills')



t3 <- ggplot(d2, aes(x=Year, y=Win, group=Team)) +
  geom_line(aes(color=Team))+
  geom_point(aes(color=Team))+
  ggtitle('Teams With Highest Dead Money') +
  xlab('Year') + 
  ylab('Number of Wins')

t3
