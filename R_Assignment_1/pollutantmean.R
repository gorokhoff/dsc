pollutantmean <- function(directory = "specdata", pollutant, id = 1:332) {
    ## 'directory' is a character vector of length 1 indicating
    ## the location of the CSV files

    ## 'pollutant' is a character vector of length 1 indicating
    ## the name of the pollutant for which we will calculate the
    ## mean; either "sulfate" or "nitrate".
    
    ## 'id' is an integer vector indicating the monitor ID numbers
    ## to be used
    
    ## Return the mean of the pollutant across all monitors list
    ## in the 'id' vector (ignoring NA values)
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
    rv<-vector("numeric")
    files<-filesNamesVector(id)
    for(i in 1:l){
        df<-read.csv(files[[i]])
        rv<-c(rv,df[[pollutant]])
    }
    bad <- is.na(rv)
    rv<-rv[!bad]
    mean(rv)
}

