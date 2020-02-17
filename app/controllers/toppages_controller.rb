class ToppagesController < ApplicationController
  
  #ログイン判定、メソッドが一個だけやからbefore_actionじゃない
  def index
    if logged_in?
      @micropost = current_user.microposts.build  #ここでは引数を設定しない。viewでのformwith用の空インスタンス
      @microposts = current_user.microposts.order(id: :desc).page(params[:page])  #一覧表示用の変数
    end
  end
end
