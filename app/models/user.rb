class User < ApplicationRecord
  # deviseの設定＝既存設定済み＝
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # ===== バリデーション =====
  validates :name, presence: true
  validates :profile, presence: true
  validates :occupation, presence: true
  validates :position, presence: true
# アソシエーション
  has_many :prototypes, dependent: :destroy  # このユーザーが投稿したPrototypeをすべて持つ
  has_many :comments, dependent: :destroy
end
