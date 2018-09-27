require "sinatra"
require_relative "models"
require "sinatra/activerecord"
require "sinatra/flash"

enable :sessions

get '/' do
    
    if session[:user_id]

    redirect '/profile'

    else
       
        erb :home

    end
end

post '/' do
    user = User.find_by(username: params[:username])
    
    
    if user && user.password == params[:password] 
        session[:user_id] = user.id
        flash[:yeah] = "You are here to stay!"

        redirect '/profile'
    else
        flash[:error] = "Wrong information, you have one more try, then..."

        
        redirect '/'
    end
end

get '/sign-up' do
    erb :sign_up
end

post '/sign-up' do 
    user = User.create(
        username: params[:username],
        firstname: params[:firstname],
        lastname: params[:lastname],
        password: params[:password],
        birthday: params[:birthday],
        email: params[:email]
    )

    session[:user_id] = user.id

    redirect '/'
end

get '/intro' do
    
    erb :intro
end 

post '/intro' do
    
        intro = Intro.create(
        title: params[:title], 
       content: params[:content],
       user_id: session[:user_id]
       
    )
    redirect '/planets'
end



get '/profile' do
    
    if session[:user_id]
        @user = User.find(session[:user_id])
        
        # @intro = Intro.all
        @intro = @user.intros.last(20).reverse

        
    erb :profile 
    else

        erb :home
    end
end



get '/planets' do
    if session[:user_id]
        @intro = Intro.last(20).reverse
    erb :planets
    

    else
        redirect '/'
    end
end

# get '/post' do
#     @intro = User.find(session{:user_id})
#     @intro = Intro.all
# end

get '/logout' do
    session[:user_id] = nil
    redirect '/'
end

get '/delete' do
    @user = User.find(session[:user_id])
    

    @user.destroy
    session[:user_id] = nil
    redirect '/'
end

get '/post' do
    intros.id = :id
    @intro = Intro.find(:id)
    @delete = @intro.destroy
end





    

    


