class BuyersController < ApplicationController
  def index
    @transaction = Transaction.new
    @item = Item.find(params[:item_id])
  end
 
 
  def create
    @item = Item.find(params[:item_id])
    @transaction = Transaction.new(transaction_params)  
     if @transaction.valid?
        @transaction.save
        redirect_to root_path
     else
       render action: :index
     end
  end
 
  private
   # 全てのストロングパラメーターを1つに統合
  def transaction_params
   params.require(:transaction).permit(:post_num, :ship_pref_id, :city, :house_num, :building, :tel).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:taken], price: item.price)
  end
end
