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
month = gets.chomp #I have to set the number of pages of the issue, since it varies from one to the other.
issue = year + month
 #"page" is the webpage where the specified issue is. (ex: issue one is in 
#http://www.ep.tc/realist/01)
ISSUE_DIR = DATA_DIR + "/" + issue
Dir.mkdir(ISSUE_DIR) unless File.exists?(ISSUE_DIR) #creates folder to store the issue on the DATA_DIR and gives it the 
#name of the issue
puts "Creating #{ISSUE_DIR} folder"



		
		for number in 1..9 # this loop downloads the first 9 pages of the issue
			pagina = BASE_ramparts_URL + issue + "?View=PDF&apages=000" + number.to_s # this defines a specific page of the magazine, starting with 1, 
			#it directs to the url where the .jpg file with the scan can be found. the format of the first 9 pages 
			#of each issue is "00", so, when I'm converting it to string (with ".to_s", I need to add a zero)
		pdf_file = RestClient.get(pagina)
File.open("#{ISSUE_DIR}/#{number}.pdf", 'w'){|f| f.write(pdf_file)}
	end

puts "done"

