require 'rails_helper'

RSpec.feature 'Comments on a Post', type: :feature do

  feature 'Adding a comment to a post' do
    scenario 'A signed in user adds a comment to a post' do
      given_there_is_a_signed_in_user
      and_i_am_viewing_a_blog_post
      and_i_have_something_to_say
      when_i_submit_text_into_the_comment_box
      then_i_should_see_the_comment_on_the_blog_post
    end

    scenario 'A signed in user fails to comment to a post' do
      given_there_is_a_signed_in_user
      and_i_am_viewing_a_blog_post
      and_i_have_something_to_say
      when_i_submit_empty_text_into_the_comment_box
      then_i_should_not_see_the_comment_on_the_blog_post
    end


    private

    def given_there_is_a_signed_in_user
      user = create(:user)
      login_as(user)
    end

    def and_i_am_viewing_a_blog_post
      blog_post = create(:blog_post)
      visit public_post_path(blog_post)
    end

    def and_i_have_something_to_say
      @comment = Faker::HarryPotter.quote
    end

    def when_i_submit_text_into_the_comment_box
      fill_in 'comment_body', with:  @comment
      click_button 'Add Comment'
    end

    def when_i_submit_empty_text_into_the_comment_box
      click_button 'Add Comment'
    end

    def then_i_should_not_see_the_comment_on_the_blog_post
      expect(page).to_not have_content(@comment)
    end

    def then_i_should_see_the_comment_on_the_blog_post
      expect(page).to have_content(@comment)
    end
  end
end
