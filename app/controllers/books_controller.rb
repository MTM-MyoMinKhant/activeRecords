class BooksController < ApplicationController
    def index
        @author_id = params[:author_id] 
        @books = Book.where(author_id: @author_id)
    end

    def new
        @book = Book.new
        @author = Author.find_by(id: params[:author_id].to_i)
        @author_id = params[:author_id]
        @url = "/authors/#{@author_id}/books/"
        @method = "post"
    end

    def create
        @book = Book.new(book_params)
        @author_id = params[:author_id]
        @url = "/authors/#{@author_id}/books/"
        @method = "post"
        if @book.save
            redirect_to "/authors/#{@author_id}/books"
        else
            @author = Author.find(@author_id)
            render :new, status: :unprocessable_entity , collection: @author
        end
    end

    def show
        @book = Book.find(params[:id])
    end

    def edit
        @book = Book.find(params[:id])
        @author = Author.find_by(id: params[:author_id].to_i)
        @author_id = params[:author_id]
        @url = "/authors/#{@author_id}/books/#{params[:id]}"
        @method = "put"
    end

    def update
        @book = Book.find(params[:id])
        @author = Author.find_by(id: params[:author_id].to_i)
        @author_id = params[:author_id]
        @url = "/authors/#{@author_id}/books/#{params[:id]}"
        @method = "put"
        if @book.update(book_params)
            redirect_to "/authors/#{@author_id}/books"
        else
            @author = Author.find(@author_id)
            render :edit, status: :unprocessable_entity , collection: @author
        end  
        
    end

    def destroy
        @author_id = params[:author_id]
        @book = Book.find(params[:id])
        @book.destroy
        redirect_to "/authors/#{@author_id}/books"
    end

    private
        def book_params
            params.require(:book).permit(:name , :author_id , :volume , :price)
        end
end
