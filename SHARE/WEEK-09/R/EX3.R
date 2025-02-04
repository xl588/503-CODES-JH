  
library(tidyverse)
library(cowplot)

n  <-  300;  
offset  <-  0.5

d  <-  data.frame(
x  =  c(rnorm(n,  mean=offset  ),  rnorm(n,  mean  =  -offset)),
y  =  c(rnorm(n,  mean=offset),  rnorm(n,  mean=-offset)),
z  =  rep(c(1,-1),  c(n,n))
)

theme_set(hrbrthemes::theme_ipsum())

a  =  ggplot(d[d$z==1,],  aes(x,y))+
      geom_point(color='blue')

b  =  ggplot(d[d$z==-1,],  aes(x,y))  +  
	  geom_point(color='red')

e  =  ggplot() +
	  geom_point(data=d[d$z==1,],  aes(x,y),  color='blue') + 
	  geom_point(data  =  d[d$z==-1,],  aes(x,y),  color='red')

f  =  ggplot()  +  
      geom_point(data  =  d[d$z==-1,],  aes(x,y),  color='red')  +
	  geom_point(data=d[d$z==1,],  aes(x,y),  color='blue')

plot_grid(a,b,e,f,  labels  =  c('A',"B",'C',  'D'))