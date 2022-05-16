class ApplicationController < ActionController::Base


    protected
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email, :encrypted_password, :last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :address, :phone_number])
    end

    def after_sign_in_path_for(resource)
      my_page_customers_path
    end


end
