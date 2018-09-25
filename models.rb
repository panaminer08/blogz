require 'sinatra/activerecord'
# require 'activerecord'
require 'pg'

configure :development do
    set :database, 'postgresql:migration-example'
  end
  
  configure :production do
    
    set :database, ENV["DATABASE_URL"]
  end

class Intro < ActiveRecord::Base
    belongs_to :user
end

class User < ActiveRecord::Base
    has_many :intros, dependent: :destroy
    
end

