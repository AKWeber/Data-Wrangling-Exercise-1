library(dplyr)
library(tidyr)
library(stringr)

refine_original$company<-tolower(refine_original$company)
refine_original<-refine_original %>% mutate(company = replace(company, company %in% c("phillips", "phllips", "phillps", "phlips", "fillips"), "philips"))
refine_original<-refine_original %>% mutate(company = replace(company, company %in% c("ak zo", "akz0"), "akzo"))
refine_original<-refine_original %>% mutate(company = replace(company, company %in% c("unilver"), "unilever"))
refine_original<-separate(refine_original, "Product code / number", c("product_code", "product_number"), sep = "-")

refine_original$product_catogory<-refine_original$product_code
refine_original$product_catogory<-str_replace(refine_original$product_catogory, "p", "Smartphone")
refine_original$product_catogory<-str_replace(refine_original$product_catogory, "x", "Laptop")
refine_original$product_catogory<-str_replace(refine_original$product_catogory, "v", "TV")
refine_original$product_catogory<-str_replace(refine_original$product_catogory, "q", "Tablet")

refine_original<-unite(refine_original, full_address, address, city, country, sep=",")

refine_original$company_philips<-0
refine_original$company_akzo<-0
refine_original$company_van_houten<-0
refine_original$company_unilever<-0
refine_original$product_smartphone<-1
refine_original$product_tv<-1
refine_original$product_laptop<-1
refine_original$product_tablet<-1
refine_clean<-refine_original


write.csv(refine_clean, "C:/Users/Angie/Documents/_School/Angie/__Data Science/_Springboard/exercises/refine_clean.csv")


