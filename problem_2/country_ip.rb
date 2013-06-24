require 'csv'
class CountryIp
  attr_accessor :numerical_representation
  def initialize
    `cat IpToCountry.csv | grep -e '^#' -v > test11.csv`
    @csv = CSV.open('test11.csv', "r:ISO-8859-15:UTF-8")
    @numerical_representation = 0
  end
  
  def search ip_string
    ip_numerical_representation = convert_ip_into_numerical_representation ip_string
    ip_short_numerical_representation = ip_numerical_representation.to_s[0..1]
    @csv.each do |row|
      if row[0].match(/^#{ip_short_numerical_representation}/) || row[1].match(/^#{ip_short_numerical_representation}/)
        if Range.new(row[0], row[1]).include?(ip_numerical_representation.to_s)
          @country = row[6] 
          break
        end
      end
    end
    @country
  end

  def convert_ip_into_numerical_representation ip_string
    ip_string.split('.').reverse.each_with_index do |value, index|
      @numerical_representation += value.to_i * (256 ** index)
    end
    @numerical_representation
  end 
end