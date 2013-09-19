class User < ActiveRecord::Base
  has_many :responders
  has_many :surveys, :through => :responders
end