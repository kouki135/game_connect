class User < ApplicationRecord
  validates :nickname, presence: true
  validates :password, presence: true, on: :create

  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX


  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


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
