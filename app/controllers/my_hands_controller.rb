# app/controllers/my_hands_controller.rb
class MyHandsController < ApplicationController
  def index
    @my_hands = MyHand.all.order(date: :desc)
  end

  def show
    @my_hand = MyHand.find(params[:id])
  end

  # 【ここから追加】
  def new
    @my_hand = MyHand.new # 新しいMyHandオブジェクトを生成
  end

  def create
    @my_hand = MyHand.new(my_hand_params) # フォームから送られたデータでオブジェクトを初期化

    if @my_hand.save # データベースに保存を試みる
      redirect_to @my_hand, notice: '手牌記録が正常に作成されました。' # 成功したら詳細ページへリダイレクト
    else
      render :new, status: :unprocessable_entity # 保存に失敗したら、newテンプレートを再表示
    end
  end
  # 【ここまで追加】

  private
  # ストロングパラメータ：フォームから受け取るデータを安全に許可する
  def my_hand_params
    params.require(:my_hand).permit(
      :score,
      :yaku_name,
      :date,
      :round_info,
      hand_data: {} # hand_dataはハッシュ（JSONB）なので、このように許可します
    )
  end
end