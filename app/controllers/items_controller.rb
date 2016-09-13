class ItemsController < ApplicationController
  def create
    @user = current_user
    @item = @user.items.new(item_params)
    @new_item = Item.new

    if @item.save
      flash[:notice] = "Task saved successfully"
    else
      flash.now[:alert] = "Task failed to save. Please try again"
    end
     redirect_to [@user]

  end
  
  private

  def item_params
    params.require(:item).permit(:name)
  end
end
