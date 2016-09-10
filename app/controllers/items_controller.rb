class ItemsController < ApplicationController
  def create
    @user = current_user
    @item = @user.items.build(item_params)
    @new_item = Item.new

    if @item.save
      flash[:notice] = "Task saved successfully"
    else
      flash[:error] = "Task failed to save"
    end

  redirect_to user_path(current_user)
  end
  private

  def item_params
    params.require(:item).permit(:name)
  end
end
