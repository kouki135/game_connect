class User < ApplicationRecord
  validates :nickname, presence: true
  validates :password, presence: true, on: :create

  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX

  has_many :relationships
  has_many :following, through: :relationships, source: :follow
  has_many :reverse_of_relationships, class_name: 'Relationship', foreigh_key: 'follow_id'
  has_many :followers, through: :reverse_of_relationships, source: :user

  def follow(other_user)
    unless self == other_user
      self.relationships.find_or_create_by(follow_id: other_user.id)
    end    
  end

  def unfollow(other_user)
    relationship = self.relationships.find_by(follow_id: other_user.id)
    relationship.destroy if relationship
  end

  def following?(other_user)
    self.followings.Include?(other_user)
  end

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
