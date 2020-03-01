require 'rails_helper'

RSpec.describe Destination, type: :model do

  context 'can save' do
    it "all:true" do
      destination = build(:destination)
      expect(destination).to be_valid
    end
  end
end
