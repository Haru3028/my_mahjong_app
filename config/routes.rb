Rails.application.routes.draw do
  get "top/index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # ここにアプリケーションのルーティング（URLと処理の対応付け）を記述します。
  # 詳しい書き方は上記のRailsガイドを参照してください。

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  # /up へのGETリクエストがあった場合に、アプリケーションのヘルスチェックを行います。
  # アプリケーションが正常に起動していればHTTPステータス200を返し、
  # 例外が発生している場合は500を返します。
  # ロードバランサーや稼働監視サービスが、アプリが生きているかを確認するために利用できます。
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  # これらの行は、プログレッシブウェブアプリ（PWA）のファイルを動的にレンダリングするためのものです。
  # PWAを利用する場合にコメントアウトを外し、app/views/pwa/* にファイルを作成します。
  # ただし、現状ではPWAは利用しないので、コメントアウトのままで問題ありません。

  # Defines the root path route ("/")
  # root "top#index"
  # アプリケーションのルートパス（"/"）へのリクエストがあった場合のルーティングを定義します。
  # 例として "posts#index" (PostsControllerのindexアクション) がコメントアウトされています。
  # このコメントアウトを外して、あなたの麻雀アプリのトップページにしたいコントローラとアクションを指定しましょう。
  # 例: root "top#index" のように記述します。
end