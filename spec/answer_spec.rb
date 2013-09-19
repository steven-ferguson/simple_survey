require 'spec_helper'

describe Answer do
  it { should belong_to :question }
  it { should have_many(:responders).through(:responses) }

  describe 'percent_of_total' do 
    it 'calculates the percentage of responses which gave that answer' do 
      question = Question.create(:content => 'How many?')
      question.answers.create(:content => '1')
      question.answers.create(:content => '2')
      3.times {question.answers.first.responses.create}
      7.times {question.answers.last.responses.create}
      question.answers.first.percent_of_total.should eq 30
    end

    it 'works when no responses exist' do 
      question = Question.create(:content => 'How many?')
      question.answers.create(:content => '1')
      question.answers.first.percent_of_total.should eq 0
    end
  end
end