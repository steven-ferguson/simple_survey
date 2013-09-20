require 'spec_helper'

describe Answer do
  it { should belong_to :question }
  it { should have_many(:responses).through(:selections) }

  describe 'percent_of_total' do 
    it 'calculates the percentage of respondants which gave that answer' do 
      question = Question.create(:content => 'How many?')
      question.answers.create(:content => '1')
      question.answers.create(:content => '2')
      3.times {question.answers.first.responses.create}
      7.times {question.answers.last.responses.create}
      question.answers.first.percent_of_total.should eq 30
    end

    it 'calculates the percentage of respondants which gave that answer' do 
      survey = Survey.create
      question = survey.questions.create(:content => 'How many?')
      question.answers.create(:content => '1')
      question.answers.create(:content => '2')
      responder1 = Responder.create
      responder2 = Responder.create
      response1 = responder1.responses.create
      response2 = responder2.responses.create
      response1.selections.create(:answer => question.answers.first)
      response2.selections.create(:answer => question.answers.first)
      response2.selections.create(:answer => question.answers.last)
      question.answers.first.selections.create(:response => responder2.responses.first)
      question.answers.last.percent_of_total.should eq 50
    end

    it 'works when no responses exist' do 
      question = Question.create(:content => 'How many?')
      question.answers.create(:content => '1')
      question.answers.first.percent_of_total.should eq 0
    end
  end
end