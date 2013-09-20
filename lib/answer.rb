class Answer < ActiveRecord::Base
  belongs_to :question
  has_many :selections
  has_many :responses, :through => :selections


  def percent_of_total
    responders = question.responses.uniq.length
    selections = self.selections.length
    percentage = responders != 0 ? ((selections.to_f / responders.to_f) * 100).floor : 0
  end
end