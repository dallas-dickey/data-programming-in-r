print('start HeadToHeadActiveBar')

h2hplot <- ggplot(data = gamesSalary, 
                  aes(x= gamesSalary$SalaryWins,
                      fill=gamesSalary$SalaryWins)) +
  geom_bar() + 
  geom_text(stat='count',
    aes(label = ..count..),
    position = position_dodge(0.9),
    vjust = 10
  ) + 
  ggtitle('Head to Head Active Salary To Wins') + 
  scale_y_discrete( name = "Number of Wins") + 
  scale_x_discrete( name = 'Highest Active Salary Results',
                      labels = c('Lost', 'Won')) +
    theme(legend.position = "None")


ggsave('HeadToHeadActiveBar.jpg', width=6, height=4)