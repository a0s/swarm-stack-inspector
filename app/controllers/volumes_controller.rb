class VolumesController < ActionController::API
  def index
    render json: Volume.all
  end
end
