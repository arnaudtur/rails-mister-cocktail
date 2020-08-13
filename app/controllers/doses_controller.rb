class DosesController < ApplicationController
    def new
    @cocktail = Cocktail.find(params[:cocktai_id])
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    # we need `restaurant_id` to associate review with corresponding restaurant
    @cocktail = Cocktail.find(params[:cocktai_id])
    @review.restaurant = @cocktail
    if @review.save
      redirect_to restaurant_path(@cocktail)
    else render :new
    end
  end
end
