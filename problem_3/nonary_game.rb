class NonaryGame
  attr_accessor :set, :soltuions
  def initialize
    @set = [1,2,3,4,5,6,7,8]
    @solutions = []
  end
  
  def valid_groups
    for i in 3..5
      set.combination(i).to_a.each do |group|
        next unless group.include? 5
        group_sum = 0
        group.each do |g| 
          group_sum += g 
          until group_sum/10 <= 0 
            remainder = group_sum%10
            quotient  = group_sum/10 
            group_sum = remainder + quotient
          end
        end
        @solutions << group if group_sum == 9
      end 
    end
    @solutions
  end
end