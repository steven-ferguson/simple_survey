require 'spec_helper'

describe Response do 
  it { should belong_to :responder }
  it { should have_many(:answers).through(:selections) }
end