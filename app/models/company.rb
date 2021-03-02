class Company < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :password, format: {with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i}

  with_options presence: true do
    validates :company_name
    validates :business_content_id, numericality: { other_than: 1 , message: 'Input correctly'}
    validates :representative_name
    validates :representative_name_kana, format: {with: /\A[ァ-ヶー－]+\z/} 
    validates :prefecture_code, format: { with: /\A\d{3}[-]\d{4}\z/, message: 'Input correctly'}
    validates :prefectures_id, numericality: { other_than: 1 , message: 'Input correctly'}
    validates :city
    validates :address
    validates :phone_number, format: { with: /\A\d{10,11}\z/, message: 'Input only number' }
    validates :foundation_date
  end

 
end
