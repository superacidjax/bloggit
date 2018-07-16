require 'rails_helper'

RSpec.describe Tag, type: :model do

  let(:blog_post) { create(:blog_post) }

  context 'relationships' do
    describe 'blog_posts' do
      it { expect(blog_post).to respond_to(:tags) }
      it { expect(blog_post).to respond_to(:tags=) }
    end
  end
end
