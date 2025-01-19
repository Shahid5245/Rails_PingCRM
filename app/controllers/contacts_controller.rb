class ContactsController < ApplicationController
  before_action :set_organizations
  def index
    @contacts = Contact.where(organization_id: @current_organization_ids).all
    if params[:name].present?
      @contacts = @contacts.where("CONCAT(first_name, ' ', last_name) LIKE ?", "%#{params[:name].downcase}%")
    end
  end

  def show
    @contact = Contact.find_by(id: params[:id])
  end

  def new
    @contact = Contact.new
    @organizations = current_user.organizations.all
  end

  def create
    @contact = Contact.create!(contact_params_permit)
    if @contact
      redirect_to @contact
    end
  end

  def edit
    @contact = Contact.find_by(id: params[:id])
    @organizations = current_user.organizations.all
  end

  def update
    contact = Contact.find_by(id: params[:id])
    if contact.update(contact_params_permit)
      redirect_to contact
    end
  end

  def destroy
    contact = Contact.find_by(id: params[:id])
    if contact
      contact.destroy
      redirect_to contacts_path
    end
  end

  private

  def set_organizations
    @current_organization_ids = current_user.organizations.pluck(:id)
  end

  def contact_params_permit
    params.require(:contact).permit(:first_name, :last_name, :organization_id, :email, :phone, :city, :address, :region, :country, :postal_code)
  end
end
