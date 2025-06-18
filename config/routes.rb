# config/routes.rb

Rails.application.routes.draw do
  # ダッシュボードをルートパスに設定
  root 'dashboards#show'

  # my_hands の既存ルーティング
  resources :my_hands

  # 他に必要なルーティングがあれば追加
  # get 'mahjong_calculator', to: 'calculators#new' # 例: 点数計算ページ
  # get 'what_to_discard', to: 'quizzes#new'       # 例: 何切る問題ページ
end