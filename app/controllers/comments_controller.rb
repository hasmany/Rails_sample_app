class CommentsController < ApplicationController
  def create

    if params[:sound_id] != nil
      @sound = Sound.find(params[:sound_id])
      @comment = @sound.comments.new(comment_params)
      @comment.save
      redirect_to "/sounds/#{@sound.id}"
    else

      @video = Video.find(params[:video_id])
      @user1= User.create(:name => "Hubert ",:email => "hubert@mail.com")
      @comment = @video.comments.new(:content => params[:comment][:content], :user_id => @user1.id)
      @comment.save
      if @comment.save
        @video_id = @comment.commentable_id
        email = UserMailer.new_comment(@user1.id,@comment.id)
        email.deliver
        redirect_to "/videos/#{@video.id}"
      end
    end
  end

  def destroy
    @video = Video.find(params[:video_id])
    @comment = Comment.find(params[:id])
    @comment.delete
    redirect_to "/videos/#{@video.id}"
  end

  private
    def comment_params
      params.require(:comment).permit(:content)
    end
end




# /videos/:video_id/comments(.:format)

# Add a spice of JavaScript to add an edit button to each of your comments.

# This should:

# Hide the normal Comment content
# Show a form with the textarea containing the Comment content
# Submit the form via AJAX and display a success message on success
# You should place your JavaScript code in the Asset Pipeline.
