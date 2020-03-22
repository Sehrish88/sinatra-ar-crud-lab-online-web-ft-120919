require 'pry'



class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end
  
  get '/articles/new' do 
    erb :new 
  end 
  
  post '/articles' do 
    #binding.pry 
    @article = Article.create(params)
    #binding.pry
   redirect "/articles/#{@article.id}"
    
  end 
  
get '/articles' do 
  @articles = Article.all 
  erb :index 
end 

  
  get '/articles/:id' do
   @article = Article.find(params[:id])
   erb :show 
  end 

  get '/articles/:id/edit' do
    @article = Article.find_by_id(params[:id])
    erb :edit
  end 
  
  patch '/articles/:id' do 
    @article = Article.find(params[:id])
    #binding.pry
    @article.update(content: params[:content], title: params[:title])
    redirect "/articles/#{@article.id}"
  end 
  
    
  delete '/articles/:id' do 
    @article = Article.find(params[:id])
    @article.destroy
    redirect '/index'
  end 
  
end
