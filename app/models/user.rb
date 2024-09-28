class User < ApplicationRecord
  validates :name, presence: true, length: { maximum: 30 }#presence: true⇛name属性は必ず入力
  validates :email, presence: true, length: { maximum: 255 }, uniqueness: true, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  # 大文字と小文字の区別をなくす
  before_validation { email.downcase! }

  # パスワードをハッシュ化
  has_secure_password

    # 省パスワードにバリデーションを設定
    validates :password, length: { minimum: 6 }
end
