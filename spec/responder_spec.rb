require 'spec_helper'

describe Responder do 
  it { should belong_to :user }
  it { should belong_to :survey }
  it { should have_many(:answers).through(:responses)}
end