module SessionsHelper
    def current_user
        @current_user ||= User.find_by(id: session[:user_id])
    end
    
    def logged_in?
        !!current_user
    end
end

#sessions controllerに対するhelperファイル、メソッド定義

#def loggedinのコード→ログインしていれば、trueを返し、してなければfalseを返す
#if文は、trueの場合に実行、falseの場合にelse以下を実行
#unless文は、falseの場合に実行

