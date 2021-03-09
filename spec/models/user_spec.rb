require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @new_user = User.new(:first_name => "Taylor", :last_name => "Ivings", :email => "ivingstaylor@gmail.com", :password => "1234567", :password_confirmation => "1234567")

    @new_user.save

    @new_user_email = User.new(:first_name => "Carlena", :last_name => "Dowden", :email => "ivingstaylor@gmail.com", :password => "1234567", :password_confirmation => "1234567")

  end


  describe "Validations" do
    it 'should have all fields' do
      expect(@new_user.first_name).to be_present
      expect(@new_user.last_name).to be_present
      expect(@new_user.email).to be_present
      expect(@new_user.password).to be_present
      expect(@new_user.password_confirmation).to be_present
    end

    it 'should throw error if email already exist' do
      expect(@new_user_email).to_not be_valid
      expect(@new_user_email.errors.full_messages).to include('Email has already been taken')
    end

  
  it 'should have a password 6 or more characters' do
    expect(@new_user.password.length).to be >= 6;
  end
end

  describe '.authenticate_with_credentials' do

    it 'should return user if info is valid' do
    expect(@new_user.authenticate_self("ivingstaylor@gmail.com", "1234567")).to be_instance_of(User)
  end

  it 'should return nil if the user info is not valid' do
    expect(@new_user.authenticate_self("ivingstaylor@gmail.com", "password")).to be_nil
  end

  it 'should return nil if the user info is not valid' do
    expect(@new_user.authenticate_self("ivingstaylor@gmail.com", "password")).to be_nil
  end
  
  #white space, capitalization


  end
end