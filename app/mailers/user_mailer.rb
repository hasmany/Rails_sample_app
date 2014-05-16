class UserMailer < ActionMailer::Base
  default from: "from@example.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.new_comment.subject
  #
  # def new_comment
  #   # @greeting = "Hi"

  #   # mail to: "to@example.org"
  # end

  def new_comment(user_id, comment_id)
    # Standard Rails
    @user = User.find(user_id)
    @comment = Comment.find(comment_id)
    @video = Video.find(@comment.commentable_id)
    @usercommentid = @comment.user_id
    @usercommentperson = User.find(@usercommentid)
    # Decoupled Rails
    # @user = MyApp.db.get_user(user_id)
    # @comment = MyApp.db.get_user(comment_id)
    # @video = MyApp.get_video(@comment.video_id)
    binding.pry
     mail(
      from: "notifier@my-app.com",
      to: @user.email,
      subject: "#{@usercommentperson.name} commented on your video #{@video.title}"
    )

    # mail (
    #   from: "notifier@my-app.com",
    #   to: @user.email,
    #   subject: "#{@comment.user} commented on your video #{@video.name}"
    # )
  end
end

