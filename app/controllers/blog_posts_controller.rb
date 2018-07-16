class BlogPostsController < ApplicationController
  include TagFiltering

  before_action :authenticate_user!

  expose :blog_posts, :all_or_filtered
  expose :blog_post

  def create
    blog_post.user_id = current_user.id
    if blog_post.save
      blog_post.tag_list=params[:blog_post][:tag_list]
      redirect_to blog_post
    else
      render :new
    end
  end

  # def update
  #   if blog_post.update(blog_post_params)
  #     redirect_to blog_post
  #   else
  #     render :edit
  #   end
  # end
  #
  # def destroy
  #   blog_post.destroy
  #   redirect_to blog_posts_path
  # end

  private

  def all_or_filtered
    filter_by_tags(true).order(created_at: :desc)
  end

  def blog_post_params
    params.require(:blog_post).permit(:title, :body, :published, :tag_list)
  end
end
