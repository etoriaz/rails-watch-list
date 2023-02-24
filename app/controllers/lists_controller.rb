class ListsController < ApplicationController
  before_action :set_list, only: %i[show]

  def index
    @lists = List.all
  end

  def new
    @list = List.new
  end

  def show
    @movies = @list.movies
    @bookmark = Bookmark.new(list: @list)
    @bookmarks = @list.bookmarks
  end

  def create
    @list = List.new(params_list)
    @list.save
    redirect_to lists_path
  end

  private

  def params_list
    params.require(:list).permit(:name, :photo)
  end

  def set_list
    @list = List.find(params[:id])
  end
end
