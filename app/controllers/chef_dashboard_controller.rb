class ChefDashboardController < ApplicationController
  def index
    respond_to do |format|
      format.html
      format.json { render json: RolesDatatable.new(view_context) }
    end
  end
end
