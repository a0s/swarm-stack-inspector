class Service
  attr_accessor :name

  def initialize(name)
    @name = name
  end

  def nodes
    raw = `docker service ps "#{name}" --format "{{.Node}}"`
    names = raw.split("\n").map(&:strip).select(&:present?).compact
    names.map { |name| Node.new(name) }
  end

  def self.all
    raw = `docker service ls --format "{{.Name}}"`
    names = raw.split("\n").map(&:strip).select(&:present?).compact
    names.map { |name| new(name) }
  end
end
