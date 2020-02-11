class ApplicationController < ActionController::Base
    
    include SessionsHelper
    
    private
    
    def require_user_logged_in
        unless logged_in?
            redirect_to login_url
        end
    end
    
    def counts(user)
        @count_microposts = user.microposts.count
        @count_followings = user.followings.count
        @count_followers = user.followers.count
    end
    
end

#他のコントローラーは全てこのクラスを継承しているから、ここで定義したメソッドが各コントローラーで使える

#他の全コントローラーで、sessionhelperクラスで定めたメソッドを使えるように、include