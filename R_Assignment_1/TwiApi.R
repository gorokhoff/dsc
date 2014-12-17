getSigTwi<-function(){
    myapp = oauth_app("twitter", key="S0ojmZVXiT1oDf3VjUgBRUDhr",secret="Lsrr8yRBxmx6NniDI31TS9Ft0zc81uXX1QCZjXFzbTcpcxqA5y")
    sig = sign_oauth1.0(myapp, token = "2497722505-NsIczHNB3drjEGE0jTP85TOXf3W2mGdVjdp6KUT", token_secret = "kiaKq6ZqqifbZjvUn4gEjp2WyrmgE0EKiIjPQWhUf5T55")
    sig
}
getSigGit<-function(){
    myapp = oauth_app("twitter", key="a93230860c4f08b25f22",secret="f4734aa09c48404024f0ee057a42f20525eceff6")
    sig = sign_oauth1.0(myapp, token = "2497722505-NsIczHNB3drjEGE0jTP85TOXf3W2mGdVjdp6KUT", token_secret = "kiaKq6ZqqifbZjvUn4gEjp2WyrmgE0EKiIjPQWhUf5T55")
    sig
}


sig<-getSigTwi()
homeTL = GET("https://api.twitter.com/1.1/friends/ids.json", sig)
json1 = content(homeTL)
json2 = jsonlite::fromJSON(toJSON(json1))
json2[1,1]