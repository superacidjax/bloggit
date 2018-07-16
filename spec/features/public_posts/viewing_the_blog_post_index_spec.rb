require 'rails_helper'

RSpec.feature 'Viewing the Public Post Index', type: :feature do

  feature 'Viewing the index page' do
    scenario 'Non-logged in user views the index page' do
      given_there_are_some_blog_posts
      when_i_visit_the_blog_index
      then_i_should_see_published_posts
    end

    private

    def given_there_are_some_blog_posts
      @unpublished_post = create(:blog_post)
      @published_post = create(:blog_post, published: true)
    end

    def when_i_visit_the_blog_index
      visit public_posts_path
    end

    def then_i_should_see_published_posts
      expect(page).to_not have_content(@unpublished_post.title)
      expect(page).to have_content(@published_post.title)
    end

  end
end
