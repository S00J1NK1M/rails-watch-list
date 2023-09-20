class ListsController < ApplicationController
  before_action :set_list, only: %i[ show destroy ]

  # GET /lists
  def index
    @lists = List.all
  end

  # GET /lists/1
  def show
  end

  # GET /lists/new
  def new
    @list = List.new
  end

  # POST "lists"
  def create
    @list = List.new(list_params)

    if @list.save
      redirect_to @list, notice: "A list has been successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # POST "lists"
  def destroy
    @list.destroy
    redirect_to lists_url, notice: "The list has been successfully destroyed.", status: :see_other
  end

  private

  def set_list
    @list = List.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def list_params
    params.require(:list).permit(:name)
  end
end
