require 'chef/rest'

module ChefHelper
  class << self
    def fetch_topology
      chef_server_url = CHEF_CONFIG['server_url']
      client_name = CHEF_CONFIG['client_name']
      file_name = File.join(Rails.root, 'chef_config', CHEF_CONFIG['client_key_file_name'])


      rest = Chef::REST.new(chef_server_url, client_name, file_name)
      roles = rest.get_rest("/roles/")

      roles_list = {}
      roles.keys.each do |role|
        search_result = rest.get_rest("/search/node?q=role:#{role}")
        nodes_list = search_result["rows"]

        nodes_arr = []
        nodes_list.each do |node|
          nodes_arr << node.name
        end

        roles_list[role] = nodes_arr
      end

      roles_list
    end
  end
end
