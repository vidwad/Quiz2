require 'rails_helper'

RSpec.describe User, type: :model do

  describe "Validations" do
    it "has an email" do
      user = FactoryBot.build :user, email: nil
      user.valid?
      expect(user.errors).to have_key(:email)
    end

      it "has a name" do
      user = FactoryBot.build :user, name: nil
      user.valid?
      expect(user.errors).to have_key(:name)
    end

    it "requires a password" do
      user = FactoryBot.build :user, password: nil
      user.save
      expect(user.errors.messages).to have_key(:password)
    end

    it "has a unique email" do
      user = FactoryBot.create :user, email: "test@codecore.ca"
      user_2 = FactoryBot.build :user, email: "test@codecore.ca"
      user_2.valid?
      expect(user_2.errors).to have_key(:email)
    end
  end

end