class Service
  attr_accessor :name

  def initialize(name)
    @name = name
  end

  def self.all
    raw = `docker service ls --format "{{.Name}}"`
    names = raw.split("\n").select(&:present?).compact
    names.map { |name| new(name) }
  end
end
