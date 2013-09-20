require 'spec_helper'

describe Question do 
  it { should belong_to :survey }
  it { should have_many :answers }

  it 'calculates the number of responses a question has received' do 
    question = Question.create(:content => 'How many people have answered me?')
    question.answers.create(:content => '0')
    question.answers.create(:content => '1')
    3.times { question.answers.first.responses.create }
    2.times { question.answers.last.responses.create }
    question.total_responses.should eq 5
  end

  it 'works for questions that allow for a multiple answers' do 
    question = Question.create(:content => 'How many people have answered me?')
    question.answers.create(:content => '0')
    question.answers.create(:content => '1')
    response = Response.create(:answer_type => 'multi')
    response.selections.create(:answer => question.answers.first)
    response.selections.create(:answer => question.answers.last)
    question.total_responses.should eq 2
  end
end