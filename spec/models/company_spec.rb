require 'rails_helper'

describe Company do
  before do
    @company = FactoryBot.build(:company)
  end

  describe 'ユーザー新規登録' do
   context '新規登録がうまくいくとき' do
      it 'company_nameとemailとpasswordとpassword_confirmationとbusiness_content_idとrepresentative_nameとrepresentative_name_kanaとprefecture_codeとprefectures_idとcityとaddressとphone_numberとfoundation_dateが存在すれば登録できること' do
        expect(@company).to be_valid
      end

      it 'passwordが6文字以上あれば登録できること' do
        @company.password = "111aaa"
        @company.password_confirmation = "111aaa"
        expect(@company).to be_valid
      end
      it 'building_nameは空でも登録できること' do
        @company.building_name = ""
        expect(@company).to be_valid
      end
    end


    context '新規登録がうまくいかないとき' do
      it 'company_nameが空では登録できない' do
        @company.company_name = ""
        @company.valid?
        expect(@company.errors.full_messages).to include("Company name can't be blank")
      end
      it 'emailが空では登録できない' do
        @company.email = ""
        @company.valid?
        expect(@company.errors.full_messages).to include("Email can't be blank")
      end
      it '重複したemailが存在する場合登録できない' do
        @company.save
        another_company = FactoryBot.build(:company, email: @company.email)
        another_company.valid?
        expect(another_company.errors.full_messages).to include("Email has already been taken")
      end
      it 'emailに@が含まれないと場合登録できない' do
        @company.email = "aaaaaaa.com"
        @company.valid?
        expect(@company.errors.full_messages).to include("Email is invalid")
      end
      it 'passwordが空では登録できない' do
        @company.password = ""
        @company.valid?
        expect(@company.errors.full_messages).to include("Password can't be blank")
      end
      it 'passwordが5文字以下では登録できない' do
        @company.password = "11aaa"
        @company.valid?
        expect(@company.errors.full_messages).to include("Password confirmation doesn't match Password", "Password is too short (minimum is 6 characters)")
      end
      it 'passwordとpassword_confirmationが不一意であれば登録できない' do
        @company.password = "aaaaaa"
        @company.password_confirmation ="aaaaab"
        @company.valid?
        expect(@company.errors.full_messages).to include("Password confirmation doesn't match Password" )
      end
      it 'passwordは半角英数字混合でなければ登録できない' do
        @company.password = "aaaaaa"
        @company.valid?
        expect(@company.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'passwordは数字のみでは登録できない' do
        @company.password = "111111"
        @company.valid?
        expect(@company.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'passwordは全角では登録できない' do
        @company.password = "ああああああ"
        @company.valid?
        expect(@company.errors.full_messages).to include("Password confirmation doesn't match Password") 
      end
      it 'business_content_idが未選択（id=1)では登録できない' do
        @company.business_content_id = 1
        @company.valid?
        expect(@company.errors.full_messages).to include("Business content Input correctly")
      end
      it 'representative_nameが空では登録できない' do
        @company.representative_name = ""
        @company.valid?
        expect(@company.errors.full_messages).to include("Representative name can't be blank")
      end
      it 'representative_name_kanaが空では登録できない' do
        @company.representative_name_kana = ""
        @company.valid?
        expect(@company.errors.full_messages).to include("Representative name kana is invalid")
      end
      it 'representative_name_kanaは全角カタカナでなければ登録できない' do
        @company.representative_name_kana = "111111"
        @company.valid?
        expect(@company.errors.full_messages).to include("Representative name kana is invalid")
      end
      it 'prefecture_codeが空では登録できない' do
        @company.prefecture_code = ""
        @company.valid?
        expect(@company.errors.full_messages).to include("Prefecture code can't be blank")
      end
      it 'prefecture_codeはハイフンを含んだ正しい形式でないと登録できない' do
        @company.prefecture_code = "1112222"
        @company.valid?
        expect(@company.errors.full_messages).to include("Prefecture code Input correctly")
      end
      it 'business_content_idが未選択（id=1)では登録できない' do
        @company.business_content_id = 1
        @company.valid?
        expect(@company.errors.full_messages).to include("Business content Input correctly")
      end
      it 'cityが空では登録できない' do
        @company.city = ""
        @company.valid?
        expect(@company.errors.full_messages).to include("City can't be blank")
      end
      it 'addressが空では登録できない' do
        @company.address = ""
        @company.valid?
        expect(@company.errors.full_messages).to include("Address can't be blank")
      end
      it 'phone_numberが空では登録できない' do
        @company.phone_number = ""
        @company.valid?
        expect(@company.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'phone_numberにハイフンを含んでいると登録できない' do
        @company.phone_number = "090-111-1111"
        @company.valid?
        expect(@company.errors.full_messages).to include("Phone number Input only number")
      end
      it 'phone_numberは12桁以上では登録できない' do
        @company.phone_number = "090111122222"
        @company.valid?
        expect(@company.errors.full_messages).to include("Phone number Input only number")
      end
      it 'phone_numberは数字でないと登録できない' do
        @company.phone_number = "aaaaaaaaaaa"
        @company.valid?
        expect(@company.errors.full_messages).to include("Phone number Input only number")
      end
      it 'foundation_dateが空では登録できない' do
        @company.foundation_date = ""
        @company.valid?
        expect(@company.errors.full_messages).to include("Foundation date can't be blank")
      end
    end
  end
end
