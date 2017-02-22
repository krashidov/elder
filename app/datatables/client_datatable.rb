class ClientDatatable < AjaxDatatablesRails::Base
  def_delegator :@view, :link_to
  def_delegator :@view, :client_path
  def_delegator :@view, :edit_client_path

  def view_columns
    # Declare strings in this format: ModelName.column_name
    # or in aliased_join_table.column_name format
    @view_columns ||= {
      first_name: {source: "Client.first_name", cond: :like },
      last_name: {source: "Client.last_name", cond: :like },
      date_of_birth: {source: "Client.date_of_birth", cond: :like },
      par_expiration: {source: "Client.par_expiration", cond: :like }
      # id: { source: "User.id", cond: :eq },
      # name: { source: "User.name", cond: :like }
    }
  end

  def data
    records.map do |record|
      {
        first_name: link_to(record.first_name, client_path(record)),
        last_name: record.last_name,
        date_of_birth: record.date_of_birth,
        par_expiration: record.par_expiration,
        actions: "#{link_to("View", client_path(record))} | #{link_to("Edit", edit_client_path(record))}"
        # example:
        # id: record.id,
        # name: record.name
      }
    end
  end

  private

  def get_raw_records
    Client.where(organization_id: 1)
  end

  # ==== These methods represent the basic operations to perform on records
  # and feel free to override them

  # def filter_records(records)
  # end

  # def sort_records(records)
  # end

  # def paginate_records(records)
  # end

  # ==== Insert 'presenter'-like methods below if necessary
end
