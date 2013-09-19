class Answer < ActiveRecord::Base
  belongs_to :question
  has_many :responses
  has_many :responders, :through => :responses

  def percent_of_total
    responses = self.responses.length
    responders = self.question.total_responses
    percentage = responders != 0 ? ((responses.to_f / responders.to_f) * 100).floor : 0
  end
end