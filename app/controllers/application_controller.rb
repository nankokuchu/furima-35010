class ApplicationController < ActionController::Base
  before_action :confiqure_permitted_parameters, if: :devise_controller?


  private

  def confiqure_permitted_parameters
    devise_parameter_sanitizer.permit(
      :sign_up,
      keys: [:nickname, :first_name, :last_name, :first_name_reading, :last_name_reading, :birthday]
    )
  end
end
