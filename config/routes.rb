Rails.application.routes.draw do

  get 'chef_dashboard/index'
  root :to => 'chef_dashboard#index'
end
