require 'active_record'
require 'rspec'
require 'shoulda-matchers'

require 'survey'
require 'question'
require 'answer'
require 'user'
require 'responder'
require 'response'
require 'selection'

ActiveRecord::Base.establish_connection(YAML::load(File.open('./db/config.yml'))["test"])

RSpec.configure do |config|
  config.after(:each) do
    Survey.all.each {|survey| survey.destroy}
    Question.all.each {|question| question.destroy}
    Answer.all.each {|answer| answer.destroy}
    User.all.each {|user| user.destroy}
    Responder.all.each {|responder| responder.destroy}
    Response.all.each {|response| response.destroy}
    Selection.all.each {|selection| selection.destroy}
  end
end