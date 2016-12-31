class Account::PostsController < ApplicationController
  before_action :authenticate_user!
  def index
    @posts = current_user.posts.recent
  end
  def edit
    find_post_and_check_permission
  end

  def update
    find_post_and_check_permission
    if @post.update(post_params)
      redirect_to account_posts_path,notice: "Update Success"
    else
      render :edit
    end
  end
  def destroy
    find_post_and_check_permission
    @post.destroy
    flash[:alert] = "Post deleted"
    redirect_to account_posts_path
  end

  private
  def post_params
    params.require(:post).permit(:content)
  end

  def find_post_and_check_permission
    @post = Post.find(params[:id])
    @group = @post.group
    if current_user != @post.user
      redirect_to root_path, alert: 'You have no permission.'
    end
  end



end
