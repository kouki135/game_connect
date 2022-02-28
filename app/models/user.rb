class User < ApplicationRecord

  validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i, message: 'は半角英数を両方含む必要があります'}

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable,  :validatable

  has_many :room_users
  has_many :rooms, through: :room_users
  has_many :messages

  def update_without_current_password(params, *options)
  params.delete(:current_password)
  
   if params[:password].blank? && params[:password_confirmation].blank? 
      params.delete(:password)
      params.delete(:password_confirmation)
   end
  
  result = update_attributes(params, *options)
  clean_up_passwords
  result
  end
  


end
