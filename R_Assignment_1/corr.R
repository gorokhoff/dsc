corr <- function(directory, threshold = 0) {
    ## 'directory' is a character vector of length 1 indicating
    ## the location of the CSV files
    
    ## 'threshold' is a numeric vector of length 1 indicating the
    ## number of completely observed observations (on all
    ## variables) required to compute the correlation between
    ## nitrate and sulfate; the default is 0
    
    ## Return a numeric vector of correlations
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
        files<-vector(mode = "character",length = 0)
        for(c in fs)
        {
            name<-makename(c)
            files[i]=name
            i<-i+1
        }
        files
    }
    #l<-length(id)
    options(digits=4)
    cmp<-complete("specdata")
    cmp<-subset(cmp, nobs > threshold)
    if(nrow(cmp)==0)
    {
        vector(mode = "numeric", length = 0) 
    }
    else{
        files<-filesNamesVector(cmp$id)
        
        l<-length(files)
        rv<-vector("numeric")
        for(i in 1:l){
            df<-read.csv(files[[i]])
            good <- complete.cases(df)
            df<-df[good, ]
            rv<-c(rv, cor(x = df$sulfate, y = df$nitrate))
        }
        rv
    }
}
