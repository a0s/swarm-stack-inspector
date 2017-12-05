class Node
  attr_accessor :name

  def initialize(name)
    @name = name
  end

  def self.myself
    raw = `docker info`
    list = raw.split("\n").map(&:strip).select(&:present?).compact
    new(list.map { |s| s.match(/\AName:\s(.*)/) ? $1 : nil }.compact[0])
  end
end
