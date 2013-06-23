class Consecutive
  attr_accessor :string

  def initialize(string)
    @string = string
  end
  
  def max_consecutive_characters
    string.scan(/((.)\2*)/).group_by{|s, c| s.length}.sort_by(&:first).last.last.map(&:last).uniq.sort
  end
end

c = Consecutive.new 'bbaa'
p c.max_consecutive_characters