class RolesDatatable
  delegate :params, :link_to, to: :@view

  def initialize(view)
    @view = view
  end

  def as_json(options = {})
    {
      aaData: data
      # aaData: [['base1', 'base2'], ['base3', 'base4']]
    }
  end

private

  def data
    res = []
    roles.each do |role, nodes_list|
      nodes_list.each do |node|
        tmp = [role, node]
        res << tmp
      end
    end

    res
  end

  def roles
    @roles ||= fetch_roles
  end

  def fetch_roles
    topology_list = ChefHelper.fetch_topology

    # @roles_list = {}

    # if topology_list.has_key?(:error)
    #   flash[:error] = topology_list[:error]
    # else
    #   @roles_list = topology_list[:roles_list]
    # end

  #   topology_list = {:roles_list=>
  # {"apache"=>["test1.test.com"],
  #  "base"=>
  #   ["prod1.test.com", "stg2.test.com", "test1.test.com", "node2.test.com"],
  #  "database"=>["stg2.test.com", "test1.test.com"],
  #  "demo"=>["stg2.test.com", "test2.test.com"],
  #  "load_balancer"=>["test1.test.com", "test2.test.com", "stg1.test.com"],
  #  "railsapp"=>["stg1.test.com"],
  #  "test"=>["prod1.test.com", "stg2.test.com"],
  #  "web_server"=>["test2.test.com"],
  #  "webapp"=>["prod1.test.com", "node2.test.com", "stg1.test.com"]}}

    topology_list[:roles_list]
  end
end
