class User < ApplicationRecord
    before_save { self.email.downcase! }
    validates :name, presence: true, length: { maximum: 50 }
    validates :email, presence: true, length: { maximum: 255 }, 
    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },uniqueness: { case_sensitive: false }
    has_secure_password
    
    has_many :microposts
    #フォロー機能に関する記載
    has_many :relationships
    has_many :followings, through: :relationships, source: :follow
    has_many :reverses_of_relationships, class_name: 'Relationship', foreign_key: 'follow_id'
    has_many :followers, through: :reverses_of_relationships, source: :user
    

    #お気に入り機能に関する記載
    has_many :likes
    has_many :favorites, through: :likes, source: :micropost
    #お互いが既存モデルのため、reverseは必要なしと判断
    

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
        self.followings.include?(other_user)
    end
    
    def feed_microposts
        Micropost.where(user_id: self.following_ids + [self.id])
    end
    
    
    
    #以下、お気に入り機能について
    #自身の投稿もいいねできるようにunlessは使わない
    def favorite(other_micropost)
          self.likes.find_or_create_by(micropost_id: other_micropost.id)
    end
    
    def unfavorite(other_micropost)
        like = self.likes.find_by(micropost_id: other_micropost.id)
        like.destroy if like
    end
    #if like  存在する（true）なら削除実行、nillなら何もしない
    
    def favoriting?(micropost)
        self.favorites.include?(micropost)
    end
end


#self.email.downcase!は入力されたメアドを全て小文字変換する機能
#モデルにレコードを保存する前に

