class ApartmentsController < ApplicationController
  # assign @apartment variable based on params[:id]
  before_action :find_apartment, only: %i[show update destroy]

  # GET /apartments
  def index
    apartments = Apartment.all
    render json: apartments
  end

  # GET /apartments/:id
  def show
    render json: @apartment
  end

  # POST /apartments
  def create
    new_apartment = Apartment.create!(apartment_params)
    render json: new_apartment, status: :created
  end

  # PATCH /apartments/:id
  def update
    @apartment.update!(apartment_params)
    render json: @apartment, status: :accepted
  end

  # DELETE /apartments/:id
  def destroy
    @apartment.destroy

    # head :no_content
    render json: @apartment, status: :accepted
  end

  private

  # set instance variable for show/update/destroy
  def find_apartment
    @apartment = Apartment.find(params[:id])
  end

  # permissible params to be used by create/update
  def apartment_params
    params.permit(:number)
  end
end
