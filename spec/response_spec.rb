require 'spec_helper'

describe Response do 
  it { should belong_to :responder }
  it { should belong_to :answer }
end