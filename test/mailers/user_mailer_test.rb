# test/mailers/user_mailer_test.rb

require 'test_helper'

class UserMailerTest < ActionMailer::TestCase
  test "new_comment" do

  # Standard Rails
  user = User.create(email: 'jojo@mailinator.com')
  video = Video.create(user_id: user.id, title: "My Video")
  comment = Comment.create(content: 'abc', user_id: user.id, :commentable_type=>"Video", :commentable_id=> video.id)
# comment1 = Comment.create(:user_id => 1, :commentable_type=>"Video", :commentable_id=> 1)
  # Decoupled Rails

  # db = MyApp.db

  # user = db.create_user(email: 'jojo@mailinator.com')
  # video = db.create_video(user_id: user.id, name: 'My Video')
  # comment = db.create_comment(content: 'hello', user_id: user.id, video_id: video.id)

  # Construct email
  email = UserMailer.new_comment(user.id, comment.id)

  # send the email
  email.deliver

  # ensures the email was delivered
  assert_not ActionMailer::Base.deliveries.empty?

  # Ensure proper postage
  assert_equal ['notifier@my-app.com'], email.from
  assert_equal ['jojo@mailinator.com'], email.to

  #Ensure subject contains key information
  assert_includes email.subject, video.title
  # assert_match email.subject, /new comment/i

  assert_includes email.body.to_s, video.title
  assert_includes email.body.to_s, comment.content

 end
end
