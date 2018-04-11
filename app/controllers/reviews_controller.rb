# app/controllers/reviews_controller.rb
class ReviewsController < ApplicationController
	def index
    @restaurant = Restaurant.find(params[:restaurant_id])
    @reviews = @restaurant.reviews
	end

	def new
    # we need @restaurant in our `simple_form_for`
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new
  end

  def create
  	@review = Review.new(review_params)
    # we need `restaurant_id` to asssociate review with corresponding restaurant
    @review.restaurant = Restaurant.find(params[:restaurant_id])
    @restaurant = Restaurant.find(params[:restaurant_id])
    if @review.save
    	redirect_to restaurant_path(@restaurant)
    else
    	render :new
    end
  end
  def show
  end


  private

  def review_params
  	params.require(:review).permit(:content, :rating)
end
end