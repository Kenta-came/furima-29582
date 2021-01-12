class BuyersController < ApplicationController
  def index
    @transaction = Transaction.new
    @item = Item.find(params[:item_id])
  end
 
 
  def create
    @item = Item.find(params[:item_id])
    @transaction = Transaction.new(transaction_params)  
     if @transaction.valid?
        pay_item
        @transaction.save
        redirect_to root_path
     else
       render action: :index
     end
  end
 
  private
   # 全てのストロングパラメーターを1つに統合
  def transaction_params
   params.require(:transaction).permit(:post_num, :ship_pref_id, :city, :house_num, :building, :tel).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token], price: @item.price)
  end
  
  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: transaction_params[:token],    # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end

end
