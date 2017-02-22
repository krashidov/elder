class ProviderDatatable < AjaxDatatablesRails::Base
  def_delegator :@view, :link_to
  def_delegator :@view, :provider_path
  def_delegator :@view, :edit_provider_path

  def view_columns
    # Declare strings in this format: ModelName.column_name
    # or in aliased_join_table.column_name format
    @view_columns ||= {
      first_name: {source: "Provider.first_name", cond: :like },
      last_name: {source: "Provider.last_name", cond: :like },
      date_of_birth: {source: "Provider.date_of_birth", cond: :like },
      staff_evaluation_date: {source: "Provider.staff_evaluation_date", cond: :like },
      id_expiration_date: {source: "Provider.id_expiration_date", cond: :like },
      work_authorization_expiration: {source: "Provider.work_authorization_expiration", cond: :like },
      safety_training_date: {source: "Provider.safety_training_date", cond: :like }
    }
  end

  def data
    records.map do |record|
      {
        first_name: record.first_name,
        last_name: record.last_name,
        date_of_birth: record.date_of_birth,
        staff_evaluation_date: record.staff_evaluation_date,
        id_expiration_date: record.id_expiration_date,
        work_authorization_expiration: record.work_authorization_expiration,
        safety_training_date: record.safety_training_date,
        actions: "#{link_to("View", provider_path(record))} | #{link_to("Edit", edit_provider_path(record))}"
        # example:
        # id: record.id,
        # name: record.name
      }
    end
  end

  private

  def get_raw_records
    Provider.where(organization_id: 1)
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
