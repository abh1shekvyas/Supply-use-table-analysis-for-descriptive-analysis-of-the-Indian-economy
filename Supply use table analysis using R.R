### Supply Use Table assignment in R

#Checking the structure of the data tables

Use <- as.matrix(read_xlsx("C:\\Users\\dell\\Desktop\\sut.xlsx", sheet = 2))
View(Use)
is.matrix(Use)

Use <- Use[-c(143:145),]  ## to remove the bottom 3 rows 
str(Use)
supply <- as.matrix(read_xlsx("C:\\Users\\dell\\Desktop\\sut.xlsx", sheet = 1))
View(supply)
str(supply)
is.matrix(supply)


#going through the data 
head(Use)
class(Use)
summary(Use)

head(supply)
class(supply)
summary(supply)

# Remove scientific notation (e values).
options(scipen = 999)

#Converting NA values to 0
Use[is.na(Use)]<-0 


#Which industry has the most supply & Use
View(max(as.numeric(supply[142,3:68]))  )
max(as.numeric(Use[142,3:68]))

#Which industry has the least supply & Use
min(as.numeric(supply[142,3:68]))  
min(as.numeric(Use[142,3:68]))



supply1 <- as.matrix(read_xlsx("C:\\Users\\dell\\Desktop\\table sut.xlsx", sheet = 1))

summary(supply1)


## Supply & Use for Primary sector products across all PRIMARY, TERTIARY AND SECONDARY industries:

PPS <- supply[1:40, 3:12]
PPS <- as.numeric(PPS)
PPS <- sum(PPS)

PPU <- Use[1:40, 3:12]
PPU <- as.numeric(PPU)
PPU <- sum(PPU)

PSS <- supply[1:40, 13:41]
PSS <- as.numeric(PSS)
PSS <- sum(PSS)

PSU <- Use[1:40,13:41]
PSU <- as.numeric(PSU)
PSU <- sum(PSU)


PTS <- supply[1:40, 42:68]
PTS <- as.numeric(PTS)
PTS <- sum(PTS)

PTU <- Use[1:40,42:68]
PTU <- as.numeric(PTU)
PTU <- sum(PTU)



## Supply & Use for Secondary sector products across all PRIMARY, TERTIARY AND SECONDARY industries:

  
  
SPS <- supply[41:112, 3:12]
SPS <- as.numeric(SPS)
SPS <- sum(SPS)

SPU <- Use[41:112, 3:12]
SPU <- as.numeric(SPU)
SPU <- sum(SPU)

SSS <- supply[41:112, 13:41]
SSS <- as.numeric(SSS)
SSS <- sum(SSS)

SSU <- Use[41:112,13:41]
SSU <- as.numeric(SSU)
SSU <- sum(SSU)


STS <- supply[41:112, 42:68]
STS <- as.numeric(STS)
STS <- sum(STS)
View(supply)
STU <- Use[41:112,42:68]
STU <- as.numeric(STU)
STU <- sum(STU)

## Supply & Use for Tertiary sector products across all PRIMARY, TERTIARY AND SECONDARY industries:
  
  
TPS <- supply[113:140, 3:12]
TPS <- as.numeric(TPS)
TPS <- sum(TPS)

TPU <- Use[113:140, 3:12]
TPU <- as.numeric(TPU)
TPU <- sum(TPU)

TSS <- supply[113:140, 13:41]
TSS <- as.numeric(TSS)
TSS <- sum(TSS)

TSU <- Use[113:140,13:41]
TSU <- as.numeric(TSU)
TSU <- sum(TSU)

TTS <- supply[113:140, 42:68]
TTS <- as.numeric(TTS)
TTS <- sum(TTS)

TTU <- Use[113:140,42:68]
TTU <- as.numeric(TTU)
TTU <- sum(TTU)


## Reduced matrix for Supply
Supply_matrix <- matrix(c(PPS,PSS,PTS,SPS,SSS,STS,TPS,TSS,TTS),byrow = T, ncol = 3)
rownames(Supply_matrix) <- c("PRIMARY", "SECONDARY", "TERTIARY")
colnames(Supply_matrix) <- c("PRIMARY", "SECONDARY", "TERTIARY")
Supply_matrix


##Reduced matrix for Use
Use_matrix <- matrix(c(PPU,PSU,PTU,SPU,SSU,STU,TPU,TSU,TTU),byrow = T, ncol = 3)
rownames(Use_matrix) <- c("PRIMARY", "SECONDARY", "TERTIARY")
colnames(Use_matrix) <- c("PRIMARY", "SECONDARY", "TERTIARY")
Use_matrix

## For which sectors is the Use more than supply
Use_matrix > Supply_matrix

## By how much is the use more than supply
Use_matrix - Supply_matrix






## According to supply use equation below:
##   "" [Output + Import] = [ Intermediate consumption + household consumption + Govt. consumtion + Investment + Exports  ] ""



# or  OP at Producer Price + Import = Total Use

Use[142,77]  ## Total Use
supply[142,77]  ##OP at Producer Price + Import 

as.numeric(Use[142,77]) - as.numeric(supply[142,77]) ## The result is 0


