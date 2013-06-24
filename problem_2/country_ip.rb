require 'csv'
class CountryIp
  
  def initialize
    
  end
  
  def parse_csv
    CSV.foreach('IpToCountry.csv') do |row|
      p row	
    end 
  end

  def search
    parse_csv
  end
  
end

c = CountryIp.new
c.search