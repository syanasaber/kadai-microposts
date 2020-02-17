class Micropost < ApplicationRecord
  belongs_to :user
  
  has_many :likes, dependent: :destroy
  has_many :favorite_users, through: :likes, source: :user
  #dependentで投稿の削除とともにお気に入りも消える
  
  #指定のユーザーがすでに投稿をお気に入りしてるかどうか
  def like_user(user_id)
      likes.find_by(user_id: user_id)
  end
  
  
  
  
  validates :content, presence: true, length: { maximum: 255 }
end

#micropostモデル内の複数カラム分は全て、USERモデル内特定の一つのuserに帰属することを示している
