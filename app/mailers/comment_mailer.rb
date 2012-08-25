class CommentMailer < ActionMailer::Base
  default from: "darkzeratul64.carlos21@gmail.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.comment_mailer.new_comment.subject
  #
  def comment_alert_message(comment, article, category)
    @comment = comment
    @article = article
    @category = category
    
    mail to: "darkzeratul64@gmail.com",
         cc: "dark_zeratul64@hotmail.com",
         subject: "A new comment has been added",
         content_type: "text/html" do |format|
      format.html
    end
  end

end
