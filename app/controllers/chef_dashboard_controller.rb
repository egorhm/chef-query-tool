require 'chef_helper'

class ChefDashboardController < ApplicationController
  def index
    @roles_list = ChefHelper.fetch_topology
  end
end
