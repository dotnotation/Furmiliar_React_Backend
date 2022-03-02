class ToysController < ApplicationController
  before_action :set_toy, only: [:show, :update, :destroy]

  # GET /toys
  def index
    @toys = Toy.all

    render json: @toys
  end

  # GET /toys/1
  def show
    render json: @toy
  end

  # POST /toys
  def create
    @toy = Toy.create!(toy_params)
    render json: @toy, status: :created, location: @toy
  end

  # PATCH/PUT /toys/1
  def update
    @toy.update!(toy_params)
    render json: @toy
  end

  # DELETE /toys/1
  def destroy
    @toy.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_toy
      @toy = Toy.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def toy_params
      params.require(:toy).permit(:name, :photo, :price, :brand, :url, :rating, :needs_repair, :squeaker, :crinkle, :treat, :pet_id)
    end
end
