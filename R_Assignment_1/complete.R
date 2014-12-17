complete <- function(directory, id = 1:332) {
    ## 'directory' is a character vector of length 1 indicating
    ## the location of the CSV files
    
    ## 'id' is an integer vector indicating the monitor ID numbers
    ## to be used
    
    ## Return a data frame of the form:
    ## id nobs
    ## 1  117
    ## 2  1041
    ## ...
    ## where 'id' is the monitor ID number and 'nobs' is the
    ## number of complete cases
    makename<-function(c){
        n<-as.character(c)
        sl<-nchar(n)
        name<-""
        if(sl == 1){
            name<-"00"
        }
        if(sl == 2){
            name<-"0"
        }
        name<-paste(directory,"\\",name,n,".CSV", sep = "")
        name
    }
    
    filesNamesVector<-function(fs){
        i<-1
        files<-c("character")
        for(c in fs)
        {
            name<-makename(c)
            files[i]=name
            i<-i+1
        }
        files
    }
    l<-length(id)
    files<-filesNamesVector(id)
    total <- data.frame(id= numeric(0), nobs= integer(0))
    for(i in 1:l){
        df<-read.csv(files[[i]])
        good <- complete.cases(df)
        df<-df[good, ]
        total<-rbind(total, data.frame(id = df$ID[1], nobs = nrow(df)))
    }
    total
    
}
#complete("specdata",2:8)