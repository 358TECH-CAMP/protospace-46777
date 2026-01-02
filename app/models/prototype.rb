class Prototype < ApplicationRecord
  belongs_to :user          # Userモデルとの関連付け
  has_many :comments, dependent: :destroy
  has_one_attached :image    # ActiveStorageで画像を添付

  # バリデーション
  validates :title, presence: true
  validates :catch_copy, presence: true
  validates :concept, presence: true
  validates :image, presence: true
end