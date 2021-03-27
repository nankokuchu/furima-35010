class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    # ひらがな、カタカナ、漢字のみ許可する
    validates :first_name, format: {with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: "Full-width characters."}
    validates :last_name, format: {with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: "Full-width characters."}
    # カタカナのみ許可する
    validates :first_name_reading, format: {with: /\A[ァ-ヶー]+\z/, message: "Full-width katakana characters"}
    validates :last_name_reading, format: {with: /\A[ァ-ヶー]+\z/, message: "Full-width katakana characters"}
    # 半角英字数字のみ許可する
    validates :nickname, format: {with: /\A[a-z0-9]+\z/i}
    validates :birthday
  end
end
