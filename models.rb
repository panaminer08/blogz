require 'sinatra/activerecord'
# require 'activerecord'
require 'pg'

# for your computer
configure :development do
    set :environment, 'development'
    set :database, 'postgresql:Racks'
end

# for heroku
configure :production do
    
    set :database, ENV["DATABASE_URL"]
end

class Intro < ActiveRecord::Base
    belongs_to :user
end

class User < ActiveRecord::Base
    has_many :intros, dependent: :destroy
end

