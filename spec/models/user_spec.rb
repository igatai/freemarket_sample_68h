require 'rails_helper'

  describe User do
    describe '#create' do

      #1 全部入力があれば、ログインできる。
      it "is valid with a family_name, first_name, family_name_zenkaku, 
      first_name_zenkaku, nickname, birthyear, birthmonth, birthday, 
      email, password, password_confirmation" do
        
        user = build(:user)
        expect(user).to be_valid
      end
      #2 family_nameがからの場合不可
      it "is invalid without a family_name" do
        user = build(:user, family_name: "")
        user.valid?
        expect(user.errors[:family_name]).to include("can't be blank")
      end
      #3 first_nameがからの場合不可
      it "is invalid without a first_name" do
        user = build(:user, first_name: "")
        user.valid?
        expect(user.errors[:first_name]).to include("can't be blank")
      end
      #4 family_name_zenkakuが空の場合不可
      it "is invalid without a family_name_zenkaku" do
        user = build(:user, family_name_zenkaku: "")
        user.valid?
        expect(user.errors[:family_name_zenkaku]).to include("can't be blank")
      end
      #5 first_name_zenkakuが空の場合不可
      it "is invalid without a first_name_zenkaku" do
        user = build(:user, first_name_zenkaku: "")
        user.valid?
        expect(user.errors[:first_name_zenkaku]).to include("can't be blank")
      end
      #6 nicknameがからの場合不可
      it "is invalid without a nickname" do
        user = build(:user, nickname: "")
        user.valid?
        expect(user.errors[:nickname]).to include("can't be blank")
      end
      #7 birthyearが空の場合不可
      it "is invalid without a birthyear" do
        user = build(:user, birthyear: "")
        user.valid?
        expect(user.errors[:birthyear]).to include("can't be blank")
      end
      #8 birthmonthが空の場合不可
      it "is invalid without a birthmonth" do
        user = build(:user, birthmonth: "")
        user.valid?
        expect(user.errors[:birthmonth]).to include("can't be blank")
      end

      #9 emailが空の場合不可
      it "is invalid without a email" do
        user = build(:user, email: "")
        user.valid?
        expect(user.errors[:email]).to include("can't be blank")
      end

      #10 重複したemailが存在する場合登録できないこと
      it "is invalid with a duplicate email" do
        
        user = create(:user)
        another_user = build(:user, email: user.email)
        another_user.valid?
        expect(another_user.errors[:email]).to include("has already been taken")
      end

      #11 birthyearが4桁の数字であること
      it "is valid with a birthyear that is 4 characters" do
        user = build(:user, birthyear: user.birthyear)
        # user.valid?
        expect(user).to be_valid
      end


      #12 birthdayが2桁以下の数字であることuser
      it "is valid with a birthday that is less than 2 characters " do
        user = build(:user, birthmonth: user.birthday)
        user.valid?
        expect(user).to be_valid
      end

      #16 birthdayが3桁の数字の場合不可
      it "isnt valid with a birthyear that is less htan 3 characters " do
        user = build(:user, birthday: "000")
        user.valid?
        expect(user.errors[:birthday]).to include("is not day")
      end

      #17 family_nameが漢字以外の場合不可
      it 'family_name must be kanji' do
        user = build(:user, family_name: "kanji")
        user.valid?
        expect(user.errors[:family_name]).to include("is not kanji")
      end

      #19 first_nameが漢字以外の場合不可
      it 'family_name must be kanji' do
        user = build(:user, first_name: "kanji")
        user.valid?
        expect(user.errors[:first_name]).to include("is not kanji")
      end

      #21 family_name_zenkakuがカタカナ以外の場合不可
      it 'family_name must be katakana' do
        user = build(:user, family_name_zenkaku: "katakana")
        user.valid?
        expect(user.errors[:family_name_zenkaku]).to include("is not katakana")
      end


      #23 first_name_zenkakuがカタカナ以外の場合不可
      it 'first_name must be katakana' do
        user = build(:user, first_name_zenkaku: "katakana")
        user.valid?
        expect(user.errors[:first_name_zenkaku]).to include("is not katakana")
      end

    end
  end
