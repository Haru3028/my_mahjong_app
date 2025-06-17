# config/routes.rb
Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  get "up" => "rails/health#show", as: :rails_health_check

  # ルートパスをTopControllerのindexアクションに設定
  root "top#index"

  # MyHandモデルのためのリソースルーティングを定義
  # これにより、/my_hands (index) と /my_hands/:id (show) などが自動で定義されます
  resources :my_hands

  # 以下は、rails generate controller MyHands index show で自動生成されたものですが、
  # resources :my_hands が定義されたので、重複するため削除しても構いません。
  # 残しておいても基本的には問題ありませんが、コードの整理のため削除を推奨します。
  # get "my_hands/index"
  # get "my_hands/show"
end