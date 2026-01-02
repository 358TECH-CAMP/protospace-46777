class ApplicationController < ActionController::Base
  # Deviseコントローラーが呼ばれる前に
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  # サインアップ時に追加のカラムを許可
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(
      :sign_up, 
      keys: [:name, :profile, :occupation, :position]
    )
  end
end
