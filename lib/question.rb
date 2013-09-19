class Question < ActiveRecord::Base 
  belongs_to :survey
  has_many :answers
  has_many :responses, :through => :answers

  def total_responses
    # responses = 0
    # self.answers.each do |answer|
    #   responses += answer.responses.length
    # end
    # responses
    responses.count
  end
end