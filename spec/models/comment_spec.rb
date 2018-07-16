require 'rails_helper'

RSpec.describe Comment do

  let(:comment) { create(:comment) }

  context 'relationships' do
    describe 'belongs_to :parent, polymorphic: true' do
      it { expect(comment).to respond_to(:parent) }
      it { expect(comment).to respond_to(:parent=) }
    end

    describe 'belongs_to :commenter, class_name: "User": "user_id"' do
      it { expect(comment).to respond_to(:commenter) }
      it { expect(comment).to respond_to(:commenter=) }
    end
  end

  context 'attributes' do
    describe 'body' do
      it { expect(comment).to respond_to(:body) }
      it { expect(comment).to respond_to(:body=) }
    end
  end

  context 'validations' do
    describe 'parent' do
      it 'must be present' do
        new_comment = Comment.new(
          body: 'Aren’t you a little short for a storm trooper?',
          commenter: create(:user)
        )
        expect(new_comment).not_to be_valid
        expect(new_comment.errors[:parent]).to eq ['must exist']
      end
    end

    describe 'commenter' do
      it 'must be present' do
        new_comment = Comment.new(
          body: 'Aren’t you a little short for a storm trooper?',
          parent: create(:blog_post)
        )
        expect(new_comment).not_to be_valid
        expect(new_comment.errors[:commenter]).to eq ['must exist']
      end
    end
  end

  describe '#new' do
    it 'instantiates a new instance' do
      comment_attrs = attributes_for(:comment)
      expect(Comment.new(comment_attrs)).to be_a Comment
    end
  end

  describe 'tags' do
    before { comment.tag('Alpine') }
    specify { expect(comment.taggings.count).to eq(1) }
  end

  describe 'comments' do
    before { comment.comments.create(
      commenter: comment.commenter, body: 'Does anyone actually use Office?') }
    specify { expect(comment.comments.count).to eq(1) }
    specify { expect(comment.commenter_comments_count).to eq(2) }
  end

end
