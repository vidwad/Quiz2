require 'rails_helper'

RSpec.describe Idea, type: :model do

  def idea
    @idea ||= FactoryBot.build(:idea)
  end


  describe "#validates" do
    it("requires a title") do
     
      i = idea
      i.title = nil
      i.valid?
      expect(i.errors.messages).to(have_key(:title))
    end

    it "requires a unique title" do
      
      persisted_i = FactoryBot.create(:idea)
      i = Idea.new title: persisted_i.title
      i.valid?
      
      expect(i.errors.messages).to(have_key(:title))
      expect(i.errors.messages[:title]).to(include("has already been taken"))
    end

    it("requires a body") do
      i = Idea.new
      i.valid?
      expect(i.errors.messages).to(have_key(:body))
    end
  end


end