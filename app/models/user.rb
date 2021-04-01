class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items

  with_options presence: true do
    # ひらがな、カタカナ、漢字のみ許可する
    with_options format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: 'Full-width characters.' } do
      validates :first_name
      validates :last_name
    end
    # カタカナのみ許可する
    with_options format: { with: /\A[ァ-ヶー]+\z/, message: 'Full-width katakana characters' } do
      validates :first_name_reading
      validates :last_name_reading
    end
    # 半角英字数字のみ許可する
    validates :nickname, format: { with: /\A[a-z0-9]+\z/i }
    validates :birthday
  end

  # パスワードは半角英字と数字のみ許可する
  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX, message: 'Include both letters and numbers'
end
