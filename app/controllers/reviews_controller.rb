class ReviewsController < ApplicationController

before_action :find_review
before_action :find_idea
before_action :authenticate_user!

def create
@review = Review.new review_params
@review.idea = @idea
@review.user = current_user

if @review.save
flash[:success] = "Review added!"
redirect_to @idea
else
@reviews = @idea.reviews.order(created_at: :desc)
flash.now[:alert] = @review.errors.full_messages.join(", ")
render "ideas/show"
end
end

def destroy
if can?(:crud, @review)
@review.destroy
flash[:success] = "Review deleted"
redirect_to @review.idea
else
flash[:alert] = "Not authorized to delete Comment!"
redirect_to @review.idea
end
end

private
def find_review
@review = Review.find params[:id] if params[:id].present?
end

def find_idea
@idea = Idea.find params[:idea_id] if params[:idea_id].present?
end

def review_params
params.require(:review).permit(:body)
end


end


