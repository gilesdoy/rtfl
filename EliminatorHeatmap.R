## THIS FILE SHOULD BE DELETED ONCE IT'S COPIED OVER TO GOOGLE DRIVE

library(tidyverse)
df <- read_csv("sandbox/elim.csv")
# This should be the Google Drive sheet I-Eliminator

df2 <- df %>% 
  group_by(elim1d1,elim2d1) %>% 
  summarise(occ=n()) %>% 
  ungroup()

ggplot(data=df2,mapping=aes(x=elim1d1,y=elim2d1,fill=occ))+
  geom_tile()+
  theme_minimal(base_size = 16)+
  theme(legend.position = "none")+
  geom_text(aes(label=occ),color="white")+
  scale_fill_gradient(low="darkblue",high="red")+
  labs(title="Eliminator Giveaway: Predictor Heatmap",
         x="Howell v Taylor-Matthews",
         y="Virgona v Lumley")
ggsave("Elim Heatmap.png",width=20, height=20, units="cm",dpi=300)
