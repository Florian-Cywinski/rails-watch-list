class ListsController < ApplicationController
  # List of features:
  # A user can see all the lists
  #   GET "lists"
  # A user can see the details of a given list and its name
  #   GET "lists/42"
  # A user can create a new list
  #   GET "lists/new"
  #   POST "lists"

  before_action :set_list, only: [:show, :destroy]

  def index
    @lists = List.all
  end

  def show
    @bookmark = Bookmark.new
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    if @list.save
      redirect_to list_path(@list)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @list.destroy
    redirect_to lists_path, status: :see_other
  end

  private

  def set_list
    @list = List.find(params[:id])
  end

  def list_params
    params.require(:list).permit(:name, :photo)
  end
end
