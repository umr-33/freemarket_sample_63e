require 'rails_helper'
describe User do
  describe '#create' do
    it "is valid without a nickname" do
     user = build(:user, nickname: "")
     #user = User.new(nickname: "", email: "kkk@gmail.com", password: "00000000", password_confirmation: "00000000")
     expect(user).to be_valid
    end
  end
end