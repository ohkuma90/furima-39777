require 'rails_helper'

RSpec.describe PurchasesForm, type: :model do
  before do
    @purchase_form = FactoryBot.build(:purchases_form)
  end
  
  context 'purchases_formが保存できる場合' do
    it '全ての値が正しく入力されていれば保存できる' do
      expect(@purchase_form).to be_valid
    end

    it 'building_nameが空でも保存できる' do
      @purchase_form.building_name = ''
      expect(@purchase_form).to be_valid
    end
  end
  
  context 'purchases_formが保存できない場合' do
    it 'item_idが空では保存できない' do
      @purchase_form.item_id = nil
      @purchase_form.valid?
      expect(@purchase_form.errors.full_messages).to include("Item can't be blank")
    end

    it 'user_idが空では保存できない' do
      @purchase_form.user_id = nil
      @purchase_form.valid?
      expect(@purchase_form.errors.full_messages).to include("User can't be blank")
    end

    it 'post_codeが空では保存できない' do
      @purchase_form.post_code = ''
      @purchase_form.valid?
      expect(@purchase_form.errors.full_messages).to include("Post code can't be blank")
    end

    it 'post_codeの-位置が異なる場合は保存できない' do
      @purchase_form.post_code = '00-000000'
      @purchase_form.valid?
      expect(@purchase_form.errors.full_messages).to include("Post code is invalid. Enter it as follows (e.g. 123-4567)")
    end

    it 'prefecture_idが空では保存できない' do
      @purchase_form.prefecture_id = ''
      @purchase_form.valid?
      expect(@purchase_form.errors.full_messages).to include("Prefecture can't be blank")
    end

    it 'prefecture_idが1では保存できない' do
      @purchase_form.prefecture_id = 1
      @purchase_form.valid?
      expect(@purchase_form.errors.full_messages).to include("Prefecture can't be blank")
    end

    it 'municipalitiesが空では保存できない' do
      @purchase_form.municipalities = ''
      @purchase_form.valid?
      expect(@purchase_form.errors.full_messages).to include("Municipalities can't be blank")
    end

    it 'street_addressが空では保存できない' do
      @purchase_form.street_address = ''
      @purchase_form.valid?
      expect(@purchase_form.errors.full_messages).to include("Street address can't be blank")
    end

    it 'telephone_numberが空では保存できない' do
      @purchase_form.telephone_number = ''
      @purchase_form.valid?
      expect(@purchase_form.errors.full_messages).to include("Telephone number can't be blank")
    end

    it 'telephone_numberが9文字以下では保存できない' do
      @purchase_form.telephone_number = '123456789'
      @purchase_form.valid?
      expect(@purchase_form.errors.full_messages).to include("Telephone number is too short (minimum is 10 characters)")
    end

    it 'telephone_numberが12文字以上では保存できない' do
      @purchase_form.telephone_number = '090-1234-5678'
      @purchase_form.valid?
      expect(@purchase_form.errors.full_messages).to include("Telephone number is too long (maximum is 11 characters)")
    end
  end
end
