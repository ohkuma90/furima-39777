require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できる場合' do
      it "nameとemail、passwordとpassword_confirmationとlast_name_ch、first_name_ch、last_name、first_nameとdate_of_birthが存在すれば登録できる" do
        expect(@user).to be_valid
      end
    end
    context '新規登録できない場合' do
      it "nameが空では登録できない" do
        @user.name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Name can't be blank")
      end
      it "emailが空では登録できない" do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it "passwordが空では登録できない" do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'passwordが5文字以下では登録できない' do
        @user.password = '12345'
        @user.password_confirmation = '12345'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end

      it 'passwordが129文字以上では登録できない' do
        @user.password =  Faker::Internet.password(min_length: 129, max_length: 150)
        @user.password_confirmation =  @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too long (maximum is 128 characters)')
      end

      it 'passwordとpassword_confirmationが不一致では登録できない' do
        @user.password = '123456'
        @user.password_confirmation = '1234567'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it '重複したemailが存在する場合は登録できない' do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end

      it 'emailは@を含まないと登録できない' do
        @user.email = 'testmail'
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end

      it "last_name_chが空では登録できない" do
        @user.last_name_ch = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name ch can't be blank")
      end

      it "first_name_chが空では登録できない" do
        @user.first_name_ch = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name ch can't be blank")
      end

      it "last_nameが空では登録できない" do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end

      it "first_nameが空では登録できない" do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end

      it "date_of_birthが空では登録できない" do
        @user.date_of_birth = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Date of birth can't be blank")
      end

    end
  end
end
