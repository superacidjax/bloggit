require 'rails_helper'

RSpec.feature 'Viewing a Post', type: :feature do

  feature 'Viewing the show pagee' do
    scenario 'Non-logged in user views a public post' do
      given_there_are_some_blog_posts
      when_i_visit_the_blog_post
      then_i_should_see_published_post
    end

    private

    def given_there_are_some_blog_posts
      @published_post = create(:blog_post, published: true)
    end

    def when_i_visit_the_blog_post
      visit public_posts_path
      click_link @published_post.title
    end

    def then_i_should_see_published_post
      expect(page).to have_content(@published_post.body)
    end

  end
end
