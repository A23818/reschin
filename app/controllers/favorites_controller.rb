# == Schema Information
#
# Table name: favorites
#
#  id            :integer          not null, primary key
#  user_id       :integer
#  restaurant_id :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
# Indexes
#
#  index_favorites_on_restaurant_id  (restaurant_id)
#  index_favorites_on_user_id        (user_id)
#

class FavoritesController < ApplicationController
  before_action :authenticate_user!

  def create
    existed_fav = Favorite.where(
        restaurant_id: params[:favorite][:restaurant_id],
        user_id: current_user.id
    )

    if existed_fav.count > 0
      existed_fav.destroy_all
    else
      @favorite = Favorite.new(favorite_params)
      @favorite.user = current_user
      @favorite.save
    end

    respond_to do |format|
        format.json {
          render json: true, status: :ok
        }
    end
  end

  private

  def favorite_params
    params.require(:favorite).permit(:restaurant_id)
  end
end
