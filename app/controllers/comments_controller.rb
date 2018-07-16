class CommentsController < ApplicationController

  expose(:comment)
  expose(:parent, :find_parent)

  def create
    self.comment = parent.comments.new(comment_params)
    comment.user_id = current_user.id
    if comment.save
      redirect_back(fallback_location: root_path)
    else
      redirect_back(fallback_location: root_path)
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end

  def find_parent
    if params && params.keys.last.include?('id')
      params.keys.last.camelize.remove!('Id').constantize.find_by_id(
        params.values.last)
    end
  end

end
