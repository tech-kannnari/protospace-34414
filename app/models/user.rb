class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  
  # deviseを導入したら追加された↓
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  # associationの記述
  has_many :prototypes 
  has_many :comments
  
  # バリデーション、空ではダメ、カラムを指定している↓
  validates :name, presence: true
  validates :profile, presence:true
  validates :occupation, presence:true
  validates :position, presence:true

end
