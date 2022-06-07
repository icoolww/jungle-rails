require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do

    it "must be created with a password" do
      
      @user = User.new(
        first_name: "Alice",
        last_name: "Anh",
        email: "a@a.com",
        password: nil,
        password_confrimation: nil
        )
        expect(@user).to be_invalid
        expect(@user.errors.full_messages).to include("Password can't be blank")
    end




  end
end