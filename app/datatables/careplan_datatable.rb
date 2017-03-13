class CareplanDatatable < AjaxDatatablesRails::Base

  def view_columns
    # Declare strings in this format: ModelName.column_name
    # or in aliased_join_table.column_name format
    @view_columns ||= {
      start_date: {}
      provider_last_name: {source: "Provider.last_name", cond: :like},
      provider_first_name: {source: "Provider.first_name", cond: :like},
      client_last_name: {source: "Client.last_name", cond: :like},
      client_first_name: {source: "Client.first_name", cond: :like},
      
      # provider_first_name: {source: "Provider.first_name", cond: :like}
      # id: { source: "User.id", cond: :eq },
      # name: { source: "User.name", cond: :like }
    }
  end

  def data
    records.map do |record|
      {
        provider_last_name: record.provider.last_name,
        provider_first_name: record.provider.first_name,
        client_last_name: record.client.last_name,
        client_first_name: record.client.first_name,
        # example:
        # id: record.id,
        # name: record.name
      }
    end
  end

  private

  def get_raw_records
    Careplan.where(organization_id: 1).includes(:provider, :client).references(:provider).distinct
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
