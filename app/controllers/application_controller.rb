class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  add_flash_types :success, :warning, :danger, :info
  include LoginHelper

  def administrator_only
    unless current_user.employee.role == 'administrator'
      redirect_to admin_items_path
    end
  end

  def kitchen_only
    unless current_user.employee.role == 'kitchen'
      redirect_to admin_index_kitchen_path
    end
  end
end
