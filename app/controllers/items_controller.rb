class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :item_params_id, except: [:index,:new, :create]

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

  def destroy
    if @item.user == current_user
       @item.destroy
    end
      redirect_to root_path
    end
  end

  def show
  end

  def edit
    if @item.user == current_user
      render "edit"
    else
      redirect_to root_path
    end
  end

  def update
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

  def item_params_id
    @item = Item.find(params[:id])
  end
end
