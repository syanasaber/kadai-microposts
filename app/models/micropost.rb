class Micropost < ApplicationRecord
  belongs_to :user
  
  validates :content, presence: true, length: { maximum: 255 }
end

#micropostモデル内の複数カラム分は全て、USERモデル内特定の一つのuserに帰属することを示している
