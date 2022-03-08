class PetsController < ApplicationController
  before_action :set_pet, only: [:show, :update, :destroy]

  # GET /pets
  def index
    @pets = Pet.all

    render json: @pets, include: :toys
  end

  # GET /pets/1
  def show
    render json: @pet, include: :toys
  end

  # POST /pets
  def create
    @pet = Pet.create!(pet_params)
    render json: @pet, status: :created, location: @pet
  end

  # PATCH/PUT /pets/1
  def update
    @pet.update!(pet_params)
      render json: @pet
  end

  # DELETE /pets/1
  def destroy
    @pet.destroy
    render json: @pet.id
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pet
      @pet = Pet.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def pet_params
      params.require(:pet).permit(:name, :photo)
    end
end
