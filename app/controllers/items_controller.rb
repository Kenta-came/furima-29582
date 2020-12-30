class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  before_action :move_to_index, except: [:index, :show]


  def index
    @items = Item.order("created_at DESC")
  end
  
  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  # def destroy
  #   item.destroy
  # end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
    if @item.user == current_user
      render "edit"
    else
      redirect_to root_path
    end
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to root_path
    else
      render :edit
    end
  end
  
  private

  def item_params
    params.require(:item).permit(:name, :detail, :price, :category_id, :condition_id, :ship_cost_id, :ship_pref_id, :ship_day_id, :image).merge(user_id: current_user.id)
  end
  

  def move_to_index
    redirect_to new_user_session_path unless user_signed_in?
  end

  def move_to_edit
    redirect_to new_user_session_path unless user_signed_in?
  end
end
