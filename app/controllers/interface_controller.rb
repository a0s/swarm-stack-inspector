class InterfaceController < ApplicationController
  def index
    @stacks = Stack.all
    @services = Service.all
    @volumes = Volume.all

    self_node = Node.myself
    @other_nodes = Service.new(ENV['SELF_SERVICE_NAME']).nodes.reject { |n| n.name == self_node.name }
  end
end
