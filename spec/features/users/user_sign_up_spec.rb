require 'rails_helper'

RSpec.feature 'User Sign Up', type: :feature do

  feature 'Signing up' do
    scenario 'a new user successfully signs up' do
      given_i_visit_the_sign_up_page
      when_i_fill_out_a_valid_email_and_password_and_submit
      then_i_should_be_on_my_blog_listing_page
    end

    scenario 'a new user unsuccessfully signs up' do
      given_i_visit_the_sign_up_page
      when_i_fill_out_a_invalid_email_and_password_and_submit
      then_i_should_see_an_error_message
    end

    private

    def given_i_visit_the_sign_up_page
      visit root_path
      click_link 'Sign Up'
    end

    def when_i_fill_out_a_valid_email_and_password_and_submit
      fill_in 'Email', with: Faker::Internet.email
      fill_in 'Password', with: 'passwordpassword'
      fill_in 'Password confirmation', with: 'passwordpassword'
      click_button 'Sign up'
    end

    def then_i_should_be_on_my_blog_listing_page
      expect(page).to have_content('Sign Out')
      expect(page).to have_content('Blog Posts')
    end


    def when_i_fill_out_a_invalid_email_and_password_and_submit
      fill_in 'Email', with: 'bademail.com' 
      fill_in 'Password', with: 'passwordpassword'
      fill_in 'Password confirmation', with: 'passwordpassword'
      click_button 'Sign up'
    end

    def then_i_should_see_an_error_message
      expect(page).to have_content('Email is invalid')
    end

  end
end
