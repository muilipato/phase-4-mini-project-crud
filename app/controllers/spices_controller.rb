class SpicesController < ApplicationController
  def index
    spices = Spice.all
    render json: spices
  end

  def create
    spice = Spice.create(spice_params)
    if spice.valid?
      render json: spice, status: :created
    else
      render json: { errors: spice.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    spice = Spice.find(params[:id])
    if spice.update(spice_params)
      render json: spice
    else
      render json: { errors: spice.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    spice = Spice.find(params[:id])
    spice.destroy
    head :no_content
  end

  private

  def spice_params
    params.require(:spice).permit(:title, :image, :description, :notes, :rating)
  end
end
