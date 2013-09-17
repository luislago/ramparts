require 'rubygems'
require 'open-uri'
require 'restclient'

#downloads a "The Realist" issue you choose to your disk

DATA_DIR = "ramparts" 
Dir.mkdir(DATA_DIR) unless File.exists?(DATA_DIR)
BASE_ramparts_URL = "http://www.unz.org/Pub/Ramparts-" #this is the site where the issues are
puts "year"
year = gets.chomp
puts "month (in english, downcase and just 3 letters)"
month = gets.chomp
issue = year + month
ISSUE_DIR = DATA_DIR + "/" + issue
Dir.mkdir(ISSUE_DIR) unless File.exists?(ISSUE_DIR) #creates folder to store the issue on the DATA_DIR and gives 
#it the year and month of the issue
puts "Creating #{ISSUE_DIR} folder"



		
		for number in 1..9
			pagina = BASE_ramparts_URL + issue + "?View=PDF&apages=000" + number.to_s 
		pdf_file = RestClient.get(pagina)
File.open("#{ISSUE_DIR}/#{number}.pdf", 'w'){|f| f.write(pdf_file)}
	end

puts "done"

