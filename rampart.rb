require 'rubygems'
require 'open-uri'

#downloads a "The Realist" issue you choose to your disk

DATA_DIR = "ramparts" 
Dir.mkdir(DATA_DIR) unless File.exists?(DATA_DIR)
BASE_ramparts_URL = "http://64.62.200.70/PERIODICAL/PDF/Ramparts-" #this is the site where the issues are
puts "year"
year = gets.chomp
puts "month (in english, downcase and just 3 letters)"
month = gets.chomp
puts "total pages"
total_pages = gets.chomp
issue = year + month
ISSUE_DIR = DATA_DIR + "/" + issue
Dir.mkdir(ISSUE_DIR) unless File.exists?(ISSUE_DIR) #creates folder to store the issue on the DATA_DIR and gives 
#it the year and month of the issue
puts "Creating #{ISSUE_DIR} folder"
pagina = BASE_ramparts_URL + issue + "/1-" + total_pages + "/" #it creates a pdf starting on the first page and ending
#on the page I set


		open(pagina) {|f|
File.open("#{ISSUE_DIR}/#{issue}.pdf", 'w') do |file| file.puts f.read end}


puts "done"

