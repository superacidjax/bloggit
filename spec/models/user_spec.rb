require 'rails_helper'

RSpec.describe User, type: :model do

  let(:user) { create(:user) }

  context 'relationships:' do
    describe 'blog_posts' do
      it { expect(user).to respond_to(:blog_posts) }
      it { expect(user).to respond_to(:blog_posts=) }

      it 'can be assigned' do
        user.blog_posts = create_list(:blog_post, 12, author: user)
        expect(user.blog_posts.count).to eq 12
      end
    end

    describe 'comments' do
      it { expect(user).to respond_to(:comments) }
      it { expect(user).to respond_to(:comments=) }
    end
  end

  describe '#new' do
    it 'is an instance of User' do
      user_attrs = attributes_for(:user)
      expect(User.new(user_attrs)).to be_a User
    end
  end
end
