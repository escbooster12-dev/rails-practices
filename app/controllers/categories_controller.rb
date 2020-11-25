class CategoriesController < ApplicationController
  before_action :require_admin, except: %i[index show]

  private

  def require_admin
    unless logged_in? && current_user.admin?
      flash[:alert] = 'Only admins can perform that action'
      redirect_to categories_path
    end
  end
end
