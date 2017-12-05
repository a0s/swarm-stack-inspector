class StacksController < ActionController::API
  def index
    @stacks = Stack.all
    render json: @stacks
  end
end
