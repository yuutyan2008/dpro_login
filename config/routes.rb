Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # 
  # ユーザの登録フォームを作成するため、newアクションを設定]
  # onlyを指定することで、特定のアクションのルーティングのみ作成

   #  form_withを使用するにはルーティングにcreateアクションを追加
   #  ユーザ登録後に遷移させるためルーティングにshowアクションを追加
   resources :users, only: [:new, :create, :show]

   # ログイン機能のSessionsコントローラ用のルーティング
   # destroyはSessionsコントローラにログアウトを行うためのdestroyアクション
   resources :sessions, only: [:new, :create, :destroy]
end
