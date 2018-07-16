require 'rails_helper'

RSpec.feature 'Viewing the Public Post Index', type: :feature do

  feature 'Viewing the index page' do
    scenario 'Non-logged in user views the index page' do
      given_there_are_some_blog_posts
      when_i_visit_the_blog_index
      then_i_should_see_published_posts
    end

    scenario 'Tag filtering for the public' do
      given_there_are_some_blog_posts
      and_they_are_tagged
      when_i_visit_the_index_with_a_tag_param
      then_i_should_only_see_the_tagged_post
    end

    scenario 'Logged in user views the index page' do
      given_there_are_some_blog_posts
      and_i_am_the_logged_in_creator
      when_i_visit_my_blog_index
      then_i_should_see_all_my_posts
    end

    scenario 'Tag filtering for my posts' do
      given_there_are_some_blog_posts
      and_i_am_the_logged_in_creator
      and_they_are_tagged
      when_i_visit_my_index_with_a_tag_param
      then_i_should_only_see_my_tagged_posts
    end

    private

    def given_there_are_some_blog_posts
      @user = create(:user)
      @unpublished_post = create(:blog_post, author: @user)
      @published_post = create(:blog_post, published: true, author: @user)
      @untagged_published_post = create(:blog_post, published: true, author: @user)
      @not_my_published_post = create(:blog_post, published: true)
    end

    def when_i_visit_the_blog_index
      visit public_posts_path
    end

    def then_i_should_see_published_posts
      expect(page).to_not have_content(@unpublished_post.title)
      expect(page).to have_content(@published_post.title)
      expect(page).to have_content(@not_my_published_post.title)
    end

    def and_they_are_tagged
      @published_post.tag('Hemingway')
      @unpublished_post.tag('Hemingway')
    end

    def when_i_visit_the_index_with_a_tag_param
      visit public_posts_path(tag: 'Hemingway')
    end

    def when_i_visit_my_index_with_a_tag_param
      visit blog_posts_path(tag: 'Hemingway')
    end

    def then_i_should_only_see_the_tagged_post
      expect(page).to have_content(@published_post.title)
      expect(page).to_not have_content(@untagged_published_post.title)
    end

    def then_i_should_only_see_my_tagged_posts
      expect(page).to have_content(@published_post.title)
      expect(page).to have_content(@unpublished_post.title)
    end

    def and_i_am_the_logged_in_creator
      login_as(@user)
    end

    def when_i_visit_my_blog_index
      visit blog_posts_path
    end

    def then_i_should_see_all_my_posts
      expect(page).to have_content(@unpublished_post.title)
      expect(page).to have_content(@published_post.title)
      expect(page).to have_content(@untagged_published_post.title)
      expect(page).to_not have_content(@not_my_published_post.title)
    end

  end
end
