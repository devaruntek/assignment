class CustomersController < ApplicationController
  before_action :authenticate_user!
  before_action :load_customer, except: [:index, :create]

  def index
    customers = Customer.order(:id)
    render json: {customers: customers}
  end

  def show
    render json: @customer
  end

  def create
    customer = Customer.new(customer_params)
    if customer.save
      render json: customer
    else
      render json: {errors: customer.errors}, status: :unprocessable_entity
    end
  end

  def update
    if @customer.update(customer_params)
      render json: @customer
    else
      render json: {errors: @customer.errors}, status: :unprocessable_entity
    end
  end

  def destroy
    if @customer.destroy
      render json: {message: "Successfully destroyed customer."}, status: :ok
    else
      render json: {errors: customer.errors}, status: :unprocessable_entity
    end
  end

  private

  def load_customer
    @customer = Customer.find(params[:id])
  end

  def customer_params
    params.require(:customer).permit(:name, :email, :age, :mobile_number)
  end
end
