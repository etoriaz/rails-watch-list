class BookmarksController < ApplicationController
  before_action :set_list, only: %i[create new]
  def create
    @bookmark = Bookmark.new(params_bookmark)
    @list = @bookmark.list
    if @bookmark.save
      redirect_to @list
    else
      render 'lists/show', status: :unprocessable_entity
    end
  end

  def delete
    @bookmark = Bookmark.find(params[:id])
    @bookmark.destroy
    redirect_to @bookmark.list
  end

  private

  def params_bookmark
    params.require(:bookmark).permit(:list_id, :movie_id, :comment)
  end

  def set_list
    @list = List.find(params[:list_id])
    @movies = @list.movies
  end
end
