module ResourceController
  def create
    resource = resource_class.create!(permitted_params)
    render json: { message: "#{resource_name} created successfully", id: resource.id }
  rescue ActiveRecord::RecordInvalid => invalid
    render json: { errors: invalid.record.errors }, status: :unprocessable_entity
  end

  def index
    render json: resource_name.constantize.all
  end

  private

  def resource_name
    controller_name.classify
  end

  def resource_class
    resource_name.constantize
  end
end