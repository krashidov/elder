module ApplicationHelper
  def sanitized_params(model, params) 
    allowed_attributes = model.attribute_names - ["id", "created_at", "updated_at"]
    params.fetch(model.name.underscore.to_sym, {}).permit(allowed_attributes).merge(@organization_params)
  end
end
