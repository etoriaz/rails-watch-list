class BookmarksController < ApplicationController
  before_action :set_bookmark, only: %i[delete]
  def new
    @bookmark = Bookmark.new
  end

  def create
    @bookmark = Bookmark.new(params_bookmark)
  end

  def delete
    @bookmark.destroy
  end

  private

  def params_bookmark
    params.require(:bookmark).require
  end

  def set_bookmark
    @bookmark = Bookmark.find(params[:id])
  end
end
