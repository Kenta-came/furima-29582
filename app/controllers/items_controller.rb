class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  #   before_action :set_item, only: [:edit, :show, :destroy, :update]
  before_action :move_to_index, except: [:index, :show, :search]


  # def index
  #   @items = Item.all
  # end
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

#   def destroy
#     item.destroy
#   end

#   def update
#     item.update(item_params)
#   end

#   def edit
#   end

#   def show
#   end

  private

  def item_params
    params.require(:item).permit(:name, :detail, :price, :category_id, :condition_id, :ship_cost_id, :ship_pref_id, :ship_day_id, :image).merge(user_id: current_user.id)
  end



#   def set_item
#     item = Item.find(params[:id])
#   end

  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end
end
