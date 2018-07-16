require 'rails_helper'

RSpec.feature 'Creating Blog Posts', type: :feature do

  feature 'Creating a new blog post' do
    scenario 'Successfully creating a new blog post' do
      user = given_there_is_a_user
      and_i_am_logged_in(user)
      and_i_am_on_the_new_blog_post_page
      when_i_fill_in_a_title_and_body_and_submit
      then_i_should_see_the_post
    end

    scenario 'Successfully creating a new blog post' do
      user = given_there_is_a_user
      and_i_am_logged_in(user)
      and_i_am_on_the_new_blog_post_page
      when_i_fill_in_incomplete_information_and_submit
      then_i_should_see_the_new_post_form
    end

    private

    def given_there_is_a_user
      create(:user)
    end

    def and_i_am_logged_in(user)
      login_as(user)
    end

    def and_i_am_on_the_new_blog_post_page
      visit new_blog_post_path
    end

    def when_i_fill_in_a_title_and_body_and_submit
      @title = Faker::HarryPotter.book
      @body = Faker::HarryPotter.quote
      fill_in 'Title', with: @title
      fill_in 'Body', with: @body
      fill_in 'blog_post_tag_list', with: 'Dogs, Cats'
      click_button 'Save Blog Post'
    end

    def when_i_fill_in_incomplete_information_and_submit
      @title = Faker::HarryPotter.book
      fill_in 'Title', with: @title
      fill_in 'blog_post_tag_list', with: 'Dogs, Cats'
      click_button 'Save Blog Post'
    end

    def then_i_should_see_the_post
      expect(page).to have_content(@title)
      expect(page).to have_content(@body)
      expect(page).to have_content('Dogs')
      expect(page).to have_content('Cats')
    end

    def then_i_should_see_the_new_post_form
      expect(page).to have_content('New Blog Post')
    end
  end
end
