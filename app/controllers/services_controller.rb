class ServicesController < ActionController::API
  def index
    @services = Service.all
    render json: @services
  end
end
