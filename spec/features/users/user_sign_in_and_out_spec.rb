require 'rails_helper'

RSpec.feature 'User Sign In and Out', type: :feature do

  feature 'Signing in' do
    scenario 'a new user successfully signs up' do
      given_i_am_a_signed_up_user
      and_i_am_not_already_signed_in
      when_i_visit_the_sign_in_page
      and_i_submit_valid_credentials
      then_i_should_be_on_my_blog_listing_page
    end

    private

    def given_i_am_a_signed_up_user
      given_i_visit_the_sign_up_page
      when_i_fill_out_a_valid_email_and_password_and_submit
    end

    def given_i_visit_the_sign_up_page
      visit root_path
      click_link 'Sign Up'
    end

    def when_i_fill_out_a_valid_email_and_password_and_submit
      @email = Faker::Internet.email
      fill_in 'Email', with: @email
      fill_in 'Password', with: 'passwordpassword'
      fill_in 'Password confirmation', with: 'passwordpassword'
      click_button 'Sign up'
    end

    def and_i_am_not_already_signed_in
      click_link 'Sign Out'
    end

    def when_i_visit_the_sign_in_page
      click_link 'Sign In'
    end

    def and_i_submit_valid_credentials
      fill_in 'Email', with: @email
      fill_in 'Password', with: 'passwordpassword'
      click_button 'Log in'
    end

    def then_i_should_be_on_my_blog_listing_page
      expect(page).to have_content('Sign Out')
      expect(page).to have_selector('h1', 'My Blog Posts')
    end

  end
end
