class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: [:facebook, :google_oauth2]

  with_options presence: true do
    validates :name, length: { maximum: 10 }
    validates :birthday
    validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i }
  end

  has_many :items
  has_many :comments
  has_many :sns_credentials

  def self.from_omniauth(auth) 
    sns = SnsCredential.where(provider: auth.provider, uid: auth.uid).first_or_create
    # sns認証したことがあればアソシエーションで取得
    # 無ければemailでユーザー検索して取得orビルド(保存はしない)
    user = User.where(email: auth.info.email).first_or_initialize(
      name: auth.info.name,
      email: auth.info.email
    )
    # userが登録済みであるか判断
   if user.persisted?
    sns.user = user
    sns.save
   end
   { user: user, sns: sns }
  end
end
