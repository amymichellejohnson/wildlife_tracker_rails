require 'rails_helper'

describe Species do
  it { should have_many :sightings }
  
  it { should validate_presence_of :name }
end
