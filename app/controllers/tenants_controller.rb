class TenantsController < ApplicationController
  # assign @tenant variable based on params[:id]
  before_action :find_tenant, only: %i[show update destroy]

  # GET /tenants
  def index
    tenants = Tenant.all
    render json: tenants
  end

  # GET /tenants/:id
  def show
    render json: @tenant
  end

  # POST /tenants
  def create
    new_tenant = Tenant.create!(tenant_params)
    render json: new_tenant, status: :created
  end

  # PATCH /tenants/:id
  def update
    @tenant.update!(tenant_params)
    render json: @tenant, status: :accepted
  end

  # DELETE /tenants/:id
  def destroy
    @tenant.destroy

    # head :no_content
    render json: @tenant, status: :accepted
  end

  private

  # set instance variable for show/update/destroy
  def find_tenant
    @tenant = Tenant.find(params[:id])
  end

  # permissible params to be used by create/update
  def tenant_params
    params.permit(:name, :age)
  end
end
