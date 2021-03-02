require 'rails_helper'

describe User do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
   context '新規登録がうまくいくとき' do
      it 'nicknameとemailとpasswordとpassword_confirmationとlast_nameとfirst_nameとlast_name_kanaとfirst_name_kanaとprefecture_codeとprefectures_idとcityとaddressとphone_numberとbirth_dayが存在すれば登録できること' do
        expect(@user).to be_valid
      end

      it 'passwordが6文字以上あれば登録できること' do
        @user.password = "111aaa"
        @user.password_confirmation = "111aaa"
        expect(@user).to be_valid
      end
      it 'building_nameは空でも登録できること' do
        @user.building_name = ""
        expect(@user).to be_valid
      end
    end


    context '新規登録がうまくいかないとき' do
      it 'nicknameが空では登録できない' do
        @user.nickname = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'emailが空では登録できない' do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it '重複したemailが存在する場合登録できない' do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end
      it 'emailに@が含まれないと場合登録できない' do
        @user.email = "aaaaaaa.com"
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end
      it 'passwordが空では登録できない' do
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'passwordが5文字以下では登録できない' do
        @user.password = "11aaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password", "Password is too short (minimum is 6 characters)")
      end
      it 'passwordとpassword_confirmationが不一意であれば登録できない' do
        @user.password = "aaaaaa"
        @user.password_confirmation ="aaaaab"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password" )
      end
      it 'passwordは半角英数字混合でなければ登録できない' do
        @user.password = "aaaaaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'passwordは数字のみでは登録できない' do
        @user.password = "111111"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'passwordは全角では登録できない' do
        @user.password = "ああああああ"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password") 
      end
      it 'last_nameが空では登録できない' do
        @user.last_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end
      it 'last_nameは全角（漢字・ひらがな・カタカナ）でなければ登録できない' do
        @user.last_name= "111111"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name is invalid")
      end
      it 'first_nameが空では登録できない' do
        @user.first_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      it 'first_nameは全角（漢字・ひらがな・カタカナ）でなければ登録できない' do
        @user.first_name = "111111"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name is invalid")  
      end
      it 'last_name_kanaが空では登録できない' do
        @user.last_name_kana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana is invalid")
      end
      it 'last_name_kanaは全角カタカナでなければ登録できない' do
        @user.last_name_kana = "111111"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana is invalid")
      end
      it 'first_name_kanaが空では登録できない' do
        @user.nickname = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'first_name_kanaは全角カタカナでなければ登録できない' do
        @user.nickname = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank") 
      end
      it 'prefecture_codeが空では登録できない' do
        @user.prefecture_code = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Prefecture code can't be blank")
      end
      it 'prefecture_codeはハイフンを含んだ正しい形式でないと登録できない' do
        @user.prefecture_code = "1112222"
        @user.valid?
        expect(@user.errors.full_messages).to include("Prefecture code Input correctly")
      end
      it 'prefectures_idが未選択（id=1)では登録できない' do
        @user.prefectures_id = 1
        @user.valid?
        expect(@user.errors.full_messages).to include("Prefectures Input correctly")
      end
      it 'cityが空では登録できない' do
        @user.city = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("City can't be blank")
      end
      it 'addressが空では登録できない' do
        @user.address = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Address can't be blank")
      end
      it 'phone_numberが空では登録できない' do
        @user.phone_number = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'phone_numberにハイフンを含んでいると登録できない' do
        @user.phone_number = "090-111-1111"
        @user.valid?
        expect(@user.errors.full_messages).to include("Phone number Input only number")
      end
      it 'phone_numberは12桁以上では登録できない' do
        @user.phone_number = "090111122222"
        @user.valid?
        expect(@user.errors.full_messages).to include("Phone number Input only number")
      end
      it 'phone_numberは数字でないと登録できない' do
        @user.phone_number = "aaaaaaaaaaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("Phone number Input only number")
      end
      it 'birth_dayが空では登録できない' do
        @user.birth_day = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Birth day can't be blank")
      end
    end
  end
end
