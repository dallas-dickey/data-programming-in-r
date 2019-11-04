print('start AgeToWinsRegression')

age_reg2015 <- lm(formula = Win ~ Average_Age , data = nfl2015 )
age_reg2016 <- lm(formula = Win ~ Average_Age , data = nfl2016 )
age_reg2017 <- lm(formula = Win ~ Average_Age , data = nfl2017 )
age_reg2018 <- lm(formula = Win ~ Average_Age , data = nfl2018 )
age_regAll <- lm(formula = Win ~ Average_Age , data = nflAllYears )

age_mregAll <- lm(formula = Win ~ Average_Age , data = nflAllYears )

summary(age_reg2015)
summary(age_reg2016)
summary(age_reg2017)
summary(age_reg2018)
summary(age_regAll)


ggplot() +
  geom_point(aes(x = nflAllYears$Average_Age, y = nflAllYears$Win),
             colour = 'orange') +
  geom_line(aes(x = nflAllYears$Average_Age, y = predict(age_mregAll, newdata = nflAllYears)),
            colour = 'black') +
  ggtitle('Simple Linear Regression for Age and Wins') +
  xlab('Average Age') + 
  ylab('Number of Wins')

ggsave('AgeToWinsRegression.jpg', width=6, height=4)

g2018w <- qplot(Average_Age, Win, data = nfl2018)
g2017w <- qplot(Average_Age, Win, data = nfl2017)
g2016w <- qplot(Average_Age, Win, data = nfl2016)
g2015w <- qplot(Average_Age, Win, data = nfl2015)
g2018l <- qplot(Average_Age, Loss, data = nfl2018)
g2017l <- qplot(Average_Age, Loss, data = nfl2017)
g2016l <- qplot(Average_Age, Loss, data = nfl2016)
g2015l <- qplot(Average_Age, Loss, data = nfl2015)
 
g2018w
g2018l
g2017w
g2017l
g2016w
g2016l
g2015w
g2015l