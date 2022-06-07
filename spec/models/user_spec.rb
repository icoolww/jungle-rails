require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do

    it "must be created with a password" do 
      @user = User.new(
        first_name: "Alice",
        last_name: "Anh",
        email: "a@a.com",
        password: nil,
        password_confirmation: nil
        )
        expect(@user).to be_invalid
        expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it "must not valid if password does not match" do 
      @user = User.new(
        first_name: "Alice",
        last_name: "Anh",
        email: "a@a.com",
        password: "1234",
        password_confirmation: "abcd"
        )
        expect(@user).to be_invalid
    end

    it "must be created if password matches" do 
      @user = User.new(
        first_name: "Alice",
        last_name: "Anh",
        email: "a@a.com",
        password: "1234",
        password_confirmation: "1234"
        )
        expect(@user.password).to eq(@user.password_confirmation)
    end

    # need to be fixed
    it "must be unique and not case sensitive" do 
      @user1 = User.new(
        first_name: "Alice",
        last_name: "Anh",
        email: "a@a.com",
        password: "1234",
        password_confirmation: "1234"
        )
      @user1.save

      @user2 = User.new(
        first_name: "Bob",
        last_name: "Bac",
        email: "A@A.com",
        password: "1234",
        password_confirmation: "1234"
        )
      expect(@user2).to be_invalid
    end

    # need to be fixed
    it "must include first name " do 
      @user = User.new(
        first_name: nil,
        last_name: "Anh",
        email: "a@a.com",
        password: "1234",
        password_confirmation: "1234"
        )
        expect(@user).to be_invalid
        expect(@user.errors.full_messages).to include("First name can't be blank")
    end

    # need to be fixed
    it "must include last name" do 
      @user = User.new(
        first_name: "Alice",
        last_name: nil,
        email: "a@a.com",
        password: "1234",
        password_confirmation: "1234"
        )
        expect(@user).to be_invalid
        expect(@user.errors.full_messages).to include("Last name can't be blank")
    end

    # need to be fixed
    it "must have at least 4 characters" do 
      @user = User.new(
        first_name: "Alice",
        last_name: "Anh",
        email: "a@a.com",
        password: "123",
        password_confirmation: "123"
        )
        expect(@user).to be_invalid
    end

  end

  describe ".authenticate_with_credentials" do

    # need to be fixed
    it "must log in a user with correct email and password" do 
      @user = User.new(
        first_name: nil,
        last_name: "Anh",
        email: "a@a.com",
        password: "1234",
        password_confirmation: "1234"
        )
      @user.save
        expect(@user.authenticate_with_credentials("a@a.com", "1234")).to be_truthy 
    end

    # need to be fixed
    it "must not a user with email and password" do 
      @user = User.new(
        first_name: nil,
        last_name: "Anh",
        email: "a@a.com",
        password: "1234",
        password_confirmation: "1234"
        )
      @user.save
        expect(@user.authenticate_with_credentials("a@a.com", "abcd")).to be_falsey 
    end


  end

end