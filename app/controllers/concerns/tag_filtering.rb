module TagFiltering
  extend ActiveSupport::Concern

  def filter_by_tags(only_for_user)
    only_for_user ? owner_posts : posts_for_the_public
  end

  private

  def owner_posts
    current_user.blog_posts.tagged_with(params[:tag]) || current_user.blog_posts
  end

  def posts_for_the_public
    if tagged_posts = BlogPost.tagged_with(params[:tag])
      tagged_posts.where(published: true).includes(
        :comments, :blog_post_attachments)
    else
      BlogPost.all.includes(:comments, :blog_post_attachments).where(
        published: true)
    end
  end

end
