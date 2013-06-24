class NonaryGame
  attr_accessor :set, :soltuions
  def initialize
    @set = [1,2,3,4,5,6,7,8]
    @solutions = []
  end
  
  def valid_groups
    for i in 2..4
      set.combination(i).to_a.each do |group|
        group <<= 5
        group.inject do |sum, member| 
          group_sum = sum + member
          while group_sum/10 <= 0
        end
          
      end	
    end
  end
  
end

n = NonaryGame.new
n.valid_groups