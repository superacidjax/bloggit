require 'rails_helper'

RSpec.describe BlogPost do

  let(:blog_post) { create(:blog_post) }
  let(:commenter) { create(:user) }

  context 'relationships' do
    describe 'belongs_to :author, class_name: "User", foreign_key: "user_id"' do
      it { expect(blog_post).to respond_to(:author) }
      it { expect(blog_post).to respond_to(:author=) }
    end

    describe 'has_many :comments' do
      it { expect(blog_post).to respond_to(:comments) }
      it { expect(blog_post).to respond_to(:comments=) }
    end
  end

  context 'attributes' do
    describe 'title' do
      it { expect(blog_post).to respond_to(:title) }
      it { expect(blog_post).to respond_to(:title=) }
    end

    describe 'body' do
      it { expect(blog_post).to respond_to(:body) }
      it { expect(blog_post).to respond_to(:body=) }
    end

    describe 'published' do
      it { expect(blog_post).to respond_to(:published) }
      it { expect(blog_post).to respond_to(:published=) }
    end

  end

  context 'validations' do
    describe 'title' do
      it 'must be present' do
        new_post = BlogPost.new(title: nil)
        expect(new_post).not_to be_valid
      end

      it 'must be unique' do
        BlogPost.create(
          title: 'Jedi Training',
          body: 'These are not the droids you are looking for',
          author: create(:user)
        )
        copy_cat = BlogPost.new(title: 'Jedi Training')
        expect(copy_cat).not_to be_valid
      end
    end

    describe 'body' do
      it 'must be present' do
        new_post = BlogPost.new(title: 'Save us Obi-Wan', body: nil)
        expect(new_post).not_to be_valid
      end
    end

    describe 'author' do
      it 'must be present' do
        new_post = BlogPost.new(title: 'Do or do not. There is no try.', body: 'I am one with the force.', author: nil)
        expect(new_post).not_to be_valid
      end
    end
  end

  describe '#new' do
    it 'is an instance of BlogPost' do
      post_attributes = attributes_for(:blog_post)
      expect(BlogPost.new(post_attributes)).to be_a BlogPost
    end
  end

  describe 'tags' do
    before { blog_post.tags.create(label: 'C3P0') }
    specify { expect(blog_post.tags.count).to eq(1) }
  end

  describe 'tagged_with' do
    before { blog_post.tag('Provence') }
    specify { expect(BlogPost.tagged_with('Provence').count).to eq(1) }
  end

  describe 'comments' do
    before { blog_post.comments.create(
      commenter: commenter, body: 'Does anyone actually use Office?') }
    specify { expect(blog_post.comments.count).to eq(1) }
    specify { expect(commenter.comments_count).to eq(1) }
  end
end
