class LikesController < ApplicationController
  before_action :require_user_logged_in
  
  def create
    micropost = Micropost.find(params[:micropost_id])
    current_user.favorite(micropost)
    flash[:success] = '投稿をお気に入りしました'
    redirect_back(fallback_location: root_path) 
  end

  def destroy
    micropost = Micropost.find(params[:micropost_id])
    current_user.unfavorite(micropost)
    flash[:success] = 'お気に入りを解除しました'
    redirect_back(fallback_location: root_path)
  end
  
  
end


#最初の誤り　→　current_user.microposts.find...、　ここは普通にモデル名.findでいい
#お気に入りcreateは、対象の投稿に対して実行するからxs