module Search
  extend ActiveSupport::Concern

  def search
    self.public_posts = BlogPost.search(params[:q]).records
  end
end
