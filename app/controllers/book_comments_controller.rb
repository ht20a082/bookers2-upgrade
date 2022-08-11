class BookCommentsController < ApplicationController

  def create
    book = Book.find(params[:book_id])
    comment = current_user.book_comments.new(book_comment_params)
    comment.book_id = book.id
    if comment.save
      redirect_back(fallback_location: root_path)
    else
      @book_comment = BookComment.new
      @book = Book.find(params[:id])
      @Book = Book.new
      render 'books/show'
    end
  end

  def destroy
    BookComment.find(params[:id]).destroy
    redirect_back(fallback_location: root_path)
  end

  private

  def book_comment_params
    params.require(:book_comment).permit(:comment)
  end

  def book_params
    params.require(:book).permit(:title, :body)
  end
end
