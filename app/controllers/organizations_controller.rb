class OrganizationsController < ApplicationController

  def index
    @organizations = Organization.all

    if params[:name].present?
      @organizations = @organizations.where("name like ?", "#{params[:name]}%")
    end
  end

  def show
    @organization = Organization.find_by(id: params[:id])
  end

  def new
    @organization = Organization.new
  end

  def create
    @organization = Organization.create!(org_params_permit)
    if @organization
      redirect_to @organization
    end
  end

  def edit
    @organization = Organization.find_by(id: params[:id])
  end

  def update
    organization = Organization.find_by(id: params[:id])
    if organization.update(org_params_permit)
      redirect_to organization
    end
  end

  def destroy
    organization = Organization.find_by(id: params[:id])
    if organization
      organization.destroy
      redirect_to organizations_path
    end
  end

  private

  def org_params_permit
    params.require(:organization).permit(:name, :email, :phone, :city, :address, :region, :country, :postal_code)
  end
end
