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
  
  def destroy
    @user = current_user
    @item = @user.items.find(params[:id])

    if @item.destroy
      flash[:notice] = "Item has been completed!"
    else
      flash[:alert] = "There was an error completing the item. Try again."
    end

    respond_to do |format|
      format.html { redirect_to :back }
      format.js
    end
  end
  
  private

  def item_params
    params.require(:item).permit(:name)
  end
end
