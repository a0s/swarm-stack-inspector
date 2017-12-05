class VolumesController < ApplicationController
  def index
    @volumes = Volume.all
  end
end
