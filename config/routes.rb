Rails.application.routes.draw do
    root to: 'toppages#index'
    
    get 'login', to: 'sessions#new'
    post 'login', to: 'sessions#create'
    delete 'logout', to: 'sessions#destroy'
    
    get 'signup', to: 'users#new'
    
    resources :users, only: [:index, :show, :new, :create] do
        member do
            get :followings
            get :followers
        end
        
        #ログインユーザーがお気に入りしている投稿一覧を表示するページにアクセスする
        member do
            get :likes
        end
    end
    
    resources :microposts, only: [:show, :create, :destroy] do
        member do
            get :favorite_user
        end
    end
    #↑後ほどmicropostsから、対象の投稿に対してお気に入りしている一覧表示するページを作る
    
    resources :relationships, only: [:create, :destroy]
    resources :likes, only: [:create, :destroy]
end


#sessionはサーバー側が持っているログイン情報
#セッション管理用のコントローラーを作成する


