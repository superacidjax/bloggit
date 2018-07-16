@user = User.create!(email: 'brian@example.com', password: 'password', password_confirmation: 'password')

50.times do
  FactoryGirl.create(:user)
end

1300.times do
  user = User.order("RANDOM()").first
  blog = FactoryGirl.create(:blog_post, published: true, author: user)
  3.times do
    blog.tag(['Yellow', 'Red', 'Green', 'Azure', 'Teal'].sample)
  end
end

1000.times do
  user = User.order("RANDOM()").first
  blog_post = BlogPost.order("RANDOM()").first
  2.times do
    FactoryGirl.create(:comment, parent: blog_post, commenter: user)
  end
end

63.times do
  user = User.order("RANDOM()").first
  comment = Comment.order("RANDOM()").first
  comment = FactoryGirl.create(:comment, parent: comment, commenter: user)
end
