module ApplicationHelper
  def sanitized_params(model, params)
    additional_whitelist ||= [] 
    allowed_attributes = (model.attribute_names - ["id", "created_at", "updated_at", "utf8", "authenticity_token"])
    x = params.fetch(model.name.underscore.to_sym, {}).permit(allowed_attributes).merge(@organization_params)
    puts x
    return x
  end
end
