class StacksController < ActionController::API
  def index
    render json: Stack.all
  end
end
