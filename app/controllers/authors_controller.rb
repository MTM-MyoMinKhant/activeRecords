class AuthorsController < ApplicationController
  def index
    @authors = Author.all
  end

  def new
    @author = Author.new
  end

  def create
    @author = Author.new(author_params) 
    if @author.save
      redirect_to authors_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @author = Author.find(params[:id])
    @author.destroy

    redirect_to authors_path
  end

  private 
    def author_params
      params.require(:author).permit(:name)
    end
end