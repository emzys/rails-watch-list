class BookmarksController < ApplicationController
  def new
    @list = List.find(params[:list_id])
    @bookmark = Bookmark.new
    # @movies = Movie.where(id: @list.movies).order(:name)
  end

  def create
    @list = List.find(params[:list_id])
    @bookmark = Bookmark.new(bookmark_params)
    @movie = Movie.find(bookmark_params[:movie_id])
    p @movie
    @bookmark.list = @list

    if @bookmark.save
      redirect_to list_path(@list)
    else
      # @movies = Movie.where(id: @list.movies).order(:name)
      render :new
    end
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    @bookmark.destroy
    redirect_to lists_path
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:comment, :movie_id)
  end
end
