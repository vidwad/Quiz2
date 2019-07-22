class LikesController < ApplicationController

    before_action :authenticate_user!
  def create
    idea = Idea.find(params[:idea_id])
    like = Like.new({user: current_user, idea: idea})

    if not can?(:like, idea)
      flash[:danger] = "liking your own idea is not an acceptable idea!..."
      return redirect_to ideas_path(idea)
    end

    if like.save
      redirect_to ideas_path(idea), notice: "Thanks for liking!"
    else
      redirect_to ideas_path(idea), alert: like.errors.full_messages.join(",")
    end
  end

  def destroy
    idea = Idea.find params[:idea_id]
    like = Like.find params[:id]
    
    if like.destroy
      redirect_to ideas_path(idea), notice: "😦"
    else 
      redirect_to ideas_path(idea), alert: like.errors.full_messages.join(",")
    end
  end

end
