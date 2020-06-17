require 'rails_helper'

describe User do
  describe '#create' do
    # 1
    it "nicknameとemail、passwordとpassword_confirmationが存在すれば登録できること" do
      user = build(:user)
      expect(user).to be_valid
    end

    # 2
    it " nicknameがない場合は登録できないこと" do
      user = build(:user, nickname: "")
      user.valid?
      expect(user.errors[:nickname]).to include("を入力してください")
    end

    # 3
    it "emailがない場合は登録できないこと" do
      user = build(:user, email: "")
      user.valid?
      expect(user.errors[:email]).to include("を入力してください")
    end

    # 4
    it "passwordがない場合は登録できないこと" do
      user = build(:user, password: "")
      user.valid?
      expect(user.errors[:password]).to include("を入力してください")
    end

    # 5
    it "passwordが存在してもpassword_confirmationがない場合は登録できないこと" do
      user = build(:user, password_confirmation: "")
      user.valid?
      expect(user.errors[:password_confirmation]).to include("とパスワードの入力が一致しません")
    end

    # # 6
    # it " nicknameが7文字以上であれば登録できないこと" do
    #   user = build(:user, nickname: "aaaaaaa")
    #   user.valid?
    #   expect(user.errors[:nickname]).to include("is too long (maximum is 6 characters)")
    # end

    # # 7
    # it "nicknameが6文字以下では登録できること " do
    #   user = build(:user, nickname: "aaaaaa")
    #   expect(user).to be_valid
    # end

    # # 8
    # it " 重複したemailが存在する場合は登録できないこと " do
    #   user = create(:user)
    #   another_user = build(:user, email: user.email)
    #   another_user.valid?
    #   expect(another_user.errors[:email]).to include("has already been taken")
    # end

    # 9
    it " passwordが7文字以上であれば登録できること " do
      user = build(:user, password: "0000000", password_confirmation: "0000000")
      expect(user).to be_valid
    end

    # 10
    it " passwordが6文字以下であれば登録できないこと " do
      user = build(:user, password: "00000", password_confirmation: "00000")
      user.valid?
      expect(user.errors[:password]).to include("は6文字以上で入力してください")
    end
  end
end