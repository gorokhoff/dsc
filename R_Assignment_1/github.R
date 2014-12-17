getGitToken<-function(){
    library(httr)
    library(httpuv)
    library(jsonlite)
    # 1. Find OAuth settings for github:
    #    http://developer.github.com/v3/oauth/
    oauth_endpoints("github")
    
    # 2. Register an application at https://github.com/settings/applications;
    #    Use any URL you would like for the homepage URL (http://github.com is fine)
    #    and http://localhost:1410 as the callback url
    #
    #    Insert your client ID and secret below - if secret is omitted, it will
    #    look it up in the GITHUB_CONSUMER_SECRET environmental variable.
    myapp <- oauth_app("github", "b2dd27377f5a5fb454de",secret = "d0b1201cdef4afd8af7f1d31f37dd13714650aa3")
    #,secret = "e778c22c5c5bca6e427cde0c679960cae8c90316"
    #dcfebf6ac3abb876b5505c4a17352637101cb174
    # 3. Get OAuth credentials
    github_token <- oauth2.0_token(oauth_endpoints("github"), myapp)
    
    # 4. Use API
    gtoken <- config(token = github_token)
    gtoken
    
    
    # OR:
    #req <- with_config(gtoken, GET("https://api.github.com/rate_limit"))
    #stop_for_status(req)
    #content(req)
}
gtoken<-getGitToken()
#http://localhost:2497/
req <- GET("https://api.github.com/users/jtleek/repos", gtoken)
#req <- GET("http://localhost:2497/", gtoken)
stop_for_status(req)
json1 = content(req)
json2 = jsonlite::fromJSON(toJSON(json1))
j<-json2[["created_at"]][5][[1]]
j