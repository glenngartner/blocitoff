class ItemsController < ApplicationController
  def create
    @item = current_user.items.create!()#what here?)
  end
end
