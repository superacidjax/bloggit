require 'rails_helper'

RSpec.shared_examples 'blog post attachments' do

  let(:blog_post) { create(:blog_post) }
  let(:attachment) { create(:blog_post_attachment, blog_post: blog_post) }

  context 'relationships' do
    describe 'belongs_to :blog_post' do
      it { expect(attachment.blog_post).to be_a BlogPost }
    end
  end

  context 'attributes' do
    describe 'title' do
      it { expect(attachment).to respond_to(:title) }
      it { expect(attachment).to respond_to(:title=) }
    end

    describe 'caption' do
      it { expect(attachment).to respond_to(:caption) }
      it { expect(attachment).to respond_to(:caption=) }
    end

    describe 'url' do
      it { expect(attachment).to respond_to(:url) }
      it { expect(attachment).to respond_to(:url=) }
    end

    describe 'media_type' do
      it { expect(attachment).to respond_to(:media_type) }
      it { expect(attachment).to respond_to(:media_type=) }
    end
  end

  context 'tags' do
    describe 'tagging' do
      before { attachment.tag('Sheldon') }
      specify { expect(attachment.tags.count).to eq(1) }
    end
  end

  describe 'comments' do
    let(:commenter) { create(:user) }
    before { attachment.comments.create(
      commenter: commenter, body: 'Does anyone actually use Office?') }
    specify { expect(attachment.comments.count).to eq(1) }
    specify { expect(commenter.comments_count).to eq(1) }
  end

end
