class PublicPostsController < ApplicationController
  include TagFiltering

  expose :public_posts, :published_and_filtered
  expose :public_post, model: BlogPost

  def search
    self.public_posts = published_and_filtered.search(params[:q]).records
    render action: :index
  end

  def index
    self.public_posts = published_and_filtered.order(created_at: :desc)
      .paginate(page: params[:page])
  end

  private

  def published_and_filtered
    filter_by_tags(false)
  end

end
