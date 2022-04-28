class LeasesController < ApplicationController
  # assign @lease variable based on params[:id]
  before_action :find_lease, only: %i[destroy]

  # POST /leases
  def create
    new_lease = Lease.create!(lease_params)
    render json: new_lease, status: :created
  end

  # DELETE /leases/:id
  def destroy
    @lease.destroy

    # head :no_content
    render json: @lease, status: :accepted
  end

  private

  # set instance variable for show/update/destroy
  def find_lease
    @lease = Lease.find(params[:id])
  end

  # permissible params to be used by create/update
  def lease_params
    params.permit(:apartment_id, :tenant_id)
  end
end
