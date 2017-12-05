class InterfaceController < ApplicationController
  def index
    @stacks = Stack.all
    @services = Service.all

    self_node = Node.myself
    @other_nodes = Service.new(ENV['SELF_SERVICE_NAME']).nodes.reject { |n| n.name == self_node.name }

    @volumes = []
    Service.new(ENV['SELF_SERVICE_NAME']).nodes.each do |node|
      url = "http://#{node.name}:#{ENV['PORT']}/volumes"
      puts "request to --- #{url}"
      response = Faraday.get(url)
      volumes = JSON.parse(response).map { |h| Volume.new(h['name']) }
      volumes.each do |volume|
        @volumes << [node.name, volume.name]
      end
    end
  end
end
