class RolesDatatable
  delegate :params, :link_to, :number_to_currency, to: :@view

  def initialize(view)
    @view = view
  end

  def as_json(options = {})
    {
      sEcho: params[:sEcho].to_i,
      # iTotalDisplayRecords: roles.total_entries,
      aaData: data
    }
  end

private

  def data
    roles.map do |role|
      [
        role
      ]
    end
  end

  def roles
    @roles ||= fetch_roles
  end

  def fetch_roles
    roles = ["aaa", "asdf", "afdgf", "adf"]#Message.order("created_at DESC")
    # roles = messages.page(page).per_page(per_page)
    roles
  end

  def page
    params[:iDisplayStart].to_i/per_page + 1
  end

  def per_page
    params[:iDisplayLength].to_i > 0 ? params[:iDisplayLength].to_i : 10
  end

  def sort_column
    columns = %w[body status]
    columns[params[:iSortCol_0].to_i]
  end

  def sort_direction
    params[:sSortDir_0] == "desc" ? "desc" : "asc"
  end
end
