require 'rails_helper'

RSpec.describe OrderDestination, type: :model do
  describe '商品購入' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @order_destination = FactoryBot.build(:order_destination, user_id: user.id, item_id: item.id)
      sleep 0.1
    end

    context '商品が購入できる場合' do
      it '全ての値が正しく入力されていれば購入できる' do
        expect(@order_destination).to be_valid
      end
      it 'buildingは空でも購入できる' do
        @order_destination.building = ''
        expect(@order_destination).to be_valid
      end
    end
    
    context '商品が購入できない場合' do
      it 'tokenが空では購入できない' do
        @order_destination.token = nil
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("Token can't be blank")
      end
      it 'postal_codeが空では購入できない' do
        @order_destination.postal_code = ''
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'postal_codeにハイフンがないと購入できない' do
        @order_destination.postal_code = '1234567'
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("Postal code is invalid")
      end
      it 'prefectures_idが空では購入できない' do
        @order_destination.prefectures_id = 1
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("Prefectures must be other than 1")
      end
      it 'municipalityが空では購入できない' do
        @order_destination.municipality = ''
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("Municipality can't be blank")
      end
      it 'adressが空では購入できない' do
        @order_destination.adress = ''
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("Adress can't be blank")
      end
      it 'phone_numberが空では購入できない' do
        @order_destination.phone_number = ''
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'phone_numberが9桁以下の数値では購入できない' do
        @order_destination.phone_number = '090123456'
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("Phone number is invalid")
      end
      it 'userが紐づいていないと購入できない' do
        @order_destination.user_id = nil
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("User can't be blank")
      end
      it 'itemが紐づいていないと購入できない' do
        @order_destination.item_id = nil
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end
