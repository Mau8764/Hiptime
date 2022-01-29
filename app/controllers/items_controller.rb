class ItemsController < ApplicationController
  before_action :find_item, only: [:edit, :update, :show, :destroy]

  def index
    if current_user
      @items = Item.where(:user_id => current_user.id).order(:created_at)
    end
  end

  def show
  end

  def new
    @item = current_user.items.build
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item)
    else
      render "edit"
    end
  end

  def destroy
    @item.destroy

    render "index"
  end

  def create
    @item = current_user.items.build(item_params)
    if @item.save
      redirect_to root_path
    else
      render "new"      
    end
  end

  private

  def item_params
    params.require(:item).permit(:title, :description)
  end

  def find_item
    @item = Item.find(params[:id]) 
  end
end
