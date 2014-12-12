class FavoriteMailer < ActionMailer::Base
  default from: "emomoop@gmail.com"
    def new_comment(user, post, comment)
 
     # New Headers
     headers["Message-ID"] = "<comments/#{comment.id}@jennie-bloccit.herokuapp.com/>"
     headers["In-Reply-To"] = "<post/#{post.id}@jennie-bloccit.herokuapp.com/>"
     headers["References"] = "<post/#{post.id}@jennie-bloccit.herokuapp.com/>"
 
     @user = user
     @post = post
     @comment = comment
 
     mail(to: user.email, subject: "New comment on #{post.title}")
   end
end
