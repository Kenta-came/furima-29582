class TransactionsController < ApplicationController

  def index
    @transaction = Transaction.new
    @item = Item.find(params[:item_id])
  end
 
 
  def create

    binding.pry

    @transaction = Transaction.new(transaction_params)  
     if @transaction.valid?
       @transaction.save
       redirect_to action: :index
     else
       render action: :new
     end
  end
 
  private
   # 全てのストロングパラメーターを1つに統合
  def transaction_params
   params.require(:transaction).permit(:post_num, :ship_pref_id, :city, :house_num, :building, :tel).merge(user_id: current_user.id, item_id: params[:item_id])
  end
  
end
