class VolumesController < ActionController::API
  def index
    @volumes = Volume.all
    render json: @volumes
  end
end
