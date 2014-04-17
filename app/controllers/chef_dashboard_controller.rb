class ChefDashboardController < ApplicationController
  def index
    topology_list = ChefHelper.fetch_topology
    @roles_list = {}

    if topology_list.has_key?(:error)
      flash[:error] = topology_list[:error]
    else
      @roles_list = topology_list[:roles_list]
    end
  end
end
