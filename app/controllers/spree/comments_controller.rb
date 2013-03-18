class Spree::CommentsController < Spree::BaseController
  def index 
    @comments = Spree::Comment.where(:approve => true).all
    @comment = Spree::Comment.new(params[:comment])
  end
  

  def create
    
    if @comment = Spree::Comment.create(params[:comment])
      redirect_to comments_url, notice: t(:comment_added_notice)
    else
      redirect_to comments_url, flash: { error: t(:comment_not_added) }
    end
  end
end