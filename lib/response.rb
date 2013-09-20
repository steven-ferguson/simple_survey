class Response < ActiveRecord::Base
  has_many :selections
  has_many :answers, :through => :selections
  belongs_to :responder

end