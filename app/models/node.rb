class Node
  attr_accessor :name

  def initialize(name)
    @name = name
  end

  def self.myself
    raw = `docker info`
    name = raw.split("\n").map(&:strip).map{|s| s.match(/\AName:\s(.*)/) ? $1 : nil}.compact[0]
    new(name)
  end
end
