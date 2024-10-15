class CustomersController < ApplicationController
  def index
    @customers = Customer.all
  end

  def missing_email
    @customers = Customer.where(email: nil).or(Customer.where(email: ''))
    render :index
  end

  def alphabetized
    @customers = Customer.order(:full_name)
    render :index
  end
end
