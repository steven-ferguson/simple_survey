class Responder < ActiveRecord::Base
  belongs_to :user
  belongs_to :survey
  has_many :responses
  has_many :answers, :through => :responses
end