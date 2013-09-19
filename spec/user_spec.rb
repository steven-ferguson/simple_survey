require 'spec_helper'

describe User do
  it { should have_many :responders}
  it { should have_many(:surveys).through(:responders) }
end