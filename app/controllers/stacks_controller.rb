class StacksController < ApplicationController
  def index
    @stacks = Stack.all
  end
end
