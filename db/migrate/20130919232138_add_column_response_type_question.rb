require './lib/question'

class AddColumnResponseTypeQuestion < ActiveRecord::Migration
  def change
    add_column :questions, :response_type, :string
    Question.all.each {|question| question.update(:response_type => 'single')}
  end
end
