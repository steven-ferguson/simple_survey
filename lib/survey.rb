class Survey < ActiveRecord::Base
  has_many :questions
  has_many :responders
  has_many :users, :through => :responders
end