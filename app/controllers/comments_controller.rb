class CommentsController < ApplicationController
    def create
        @article = Article.find(params[:article_id])
        @comment = @article.comments.create(comment_params.merge(user_id: current_user.id))
        redirect_to article_path(@article)
      end
    def destroy
      @article = Article.find(params[:article_id])
      @comment = @article.comments.find(params[:id])
      @comment.destroy
      redirect_to article_path(@article), status: :see_other
    end

      private
        def comment_params
          params.require(:comment).permit( :user_id,:commenter, :body)
        end
    
end
