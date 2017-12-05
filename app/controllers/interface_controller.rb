class InterfaceController < ApplicationController
  def index
    @stacks = Stack.all
    @services = Service.all
    @volumes = Volume.all
  end
end
