class Public::CustomersController < ApplicationController
    before_action :authenticate_customer!


    def show
      @customer = current_customer
    end

    def edit
      @customer = current_customer
    end

    def update
      @customer = current_customer
      if @customer.update(customer_params)
      redirect_to my_page_customers_path
      else
      render 'edit'
      end
    end

    def withdraw
      @customer = Customer.find(current_customer.id)
      @customer.update(is_deleted: true)
      reset_session
      redirect_to my_page_customers_path
    end


    private
    def customer_params
        params.require(:customer).permit(:last_name, :first_name,
                                        :last_name_kana, :first_name_kana,
                                        :email, :postal_code, :address, :phone_number)
    end


end
