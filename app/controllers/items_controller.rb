class ItemsController < ApplicationController
  def destroy
	  @item = Item.find(params[:id])
	  @item.destroy

	  respond_to do |format|
		  format.html { redirect_to payments_url }
		  format.json { head :no_content }
	  end
  end
end
