class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  #アソシエーション
  has_many :items
  has_many :buyers

  
  with_options presence: true do
    validates :nickname
    validates :birthday
    validates :email, format: { with: /[@]/ , message: 'メールアドレスに「＠」を挿入してください！'}

    with_options format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i ,message: '半角英数字を混合してください！'} do
      validates :password
    end
    with_options format: { with: /\A[ぁ-んァ-ン一-龥々]/ , message: '全角文字を使用してください！'} do
      validates :first_name
      validates :last_name
    end
    with_options format: { with: /\A[ァ-ヶー－]+\z/ , message: '全角カタカナを使用してください！'} do
      validates :first_name_kana
      validates :last_name_kana
    end
  end
end
