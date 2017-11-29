class StacksController < ApplicationController
  def index
    @stacks = `docker stack ls --format "{{.Name}}"`.split("\n")
    @services = `docker service ls --format "{{.Name}}"`.split("\n")
  end
end
