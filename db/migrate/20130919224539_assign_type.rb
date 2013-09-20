require './lib/response'

class AssignType < ActiveRecord::Migration
  def change
    Response.all.each {|response| response.update(:type => 'single')}
  end
end
