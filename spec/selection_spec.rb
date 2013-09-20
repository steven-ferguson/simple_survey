require 'spec_helper'

describe Selection do
  it { should belong_to :answer }
  it { should belong_to :response }
end