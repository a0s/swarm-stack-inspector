class ServicesController < ActionController::API
  def index
    render json: Service.all
  end
end
