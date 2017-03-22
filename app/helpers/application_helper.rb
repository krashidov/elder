module ApplicationHelper
  def sanitized_params(model, params, additional_whitelist)
    additional_whitelist ||= [] 
    allowed_attributes = (model.attribute_names - ["id", "created_at", "updated_at"])
      .concat(additional_whitelist)
    params.permit(allowed_attributes).merge(@organization_params)
  end
end
