class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  private
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :prefecture_code, :prefectures_id, :city, :address, :building_name, :phone_number, :birth_day, :last_name, :first_name, :last_name_kana, :first_name_kana, :company_name, :company_name_kana, :business_content_id, :representative_name,:representative_name_kana, :employee_number, :foundation_date])  
    
  end

  
end
