class IdeasController < ApplicationController
before_action :authenticate_user!, except: [:index, :show]
before_action :find_idea
before_action :authorize!, only: [:edit, :update, :destroy]

def index
@ideas = Idea.order(created_at: :desc)
end

def show
@review = Review.new
# @likes = @idea.likes.count
@reviews = @idea.reviews.order(created_at: :desc)
end

def new
@idea = Idea.new
end

def create
@idea = Idea.new idea_params
@idea.user = current_user
if @idea.save
flash[:success] = "Idea created!"
redirect_to @idea
else
flash.now[:alert] = @idea.errors.full_messages.join(", ")
render :new
end
end

def edit
end

def update
if @idea.update idea_params
flash[:success] = "Idea updated!"
redirect_to @idea
else
flash.now[:alert] = @idea.errors.full_messages.join(", ")
render :edit
end
end

def destroy
@idea.destroy
flash[:success] = "Idea deleted"
redirect_to ideas_path
end

private
def find_idea
@idea = Idea.find(params[:id]) if params[:id].present?
end

def idea_params
params.require(:idea).permit(:title, :body)
end

def authorize!
redirect_to root_path, alert: 'Not Authorized' unless can?(:crud, @idea)
end

end
