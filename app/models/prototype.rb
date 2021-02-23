class Prototype < ApplicationRecord
  # associationの記述
  # belongs_to にはsは付けない！
  belongs_to :user
  has_many :comments
  has_many :comments, dependent: :destroy

  # as_one_attachedを使用してimageカラムとのアソシエーションを記述した
  has_one_attached :image
  # カラムの中が空はダメという記述
  validates :title, presence: true
  validates :catch_copy, presence: true
  validates :concept, presence: true
  validates :image, presence: true
end
