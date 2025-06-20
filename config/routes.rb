# config/routes.rb

Rails.application.routes.draw do
  resources :score_calculators
  # ダッシュボードをルートパスに設定
  root 'dashboards#show'

  # 他に必要なルーティングがあれば追加
  # get 'mahjong_calculator', to: 'calculators#new' # 例: 点数計算ページ
  # get 'what_to_discard', to: 'quizzes#new'       # 例: 何切る問題ページ
end