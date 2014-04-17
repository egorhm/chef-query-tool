class RolesDatatable
  delegate :params, :link_to, to: :@view

  def initialize(view)
    @view = view
  end

  def as_json(options = {})
    {
      aaData: data
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

    roles_list = Hash.new

    unless topology_list.has_key?(:error)
      roles_list = topology_list[:roles_list]
    end

    roles_list
  end
end
