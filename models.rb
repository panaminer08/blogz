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
    DISABLE_DATABASE_ENVIRONMENT_CHECK=1
    set :database, ENV["DATABASE_URL"]
end

class Intro < ActiveRecord::Base
    belongs_to :user
end

class User < ActiveRecord::Base
    has_many :intros, dependent: :destroy
end

