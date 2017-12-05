class Volume
  attr_accessor :name

  def initialize(name)
    @name = name
  end

  def self.all
    raw = `docker volume ls --format "{{.Name}}"`
    names = raw.split("\n").map(&:strip).select(&:present?).compact
    names.map { |name| new(name) }
  end
end
