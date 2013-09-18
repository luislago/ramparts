require 'rubygems'
require 'open-uri'

#downloads a "Ramparts" issue you choose to your disk

DATA_DIR = "ramparts" 
Dir.mkdir(DATA_DIR) unless File.exists?(DATA_DIR)
BASE_ramparts_URL = "http://64.62.200.70/PERIODICAL/PDF/Ramparts-" #this is the site where the issues are
puts "year"
year = gets.chomp
puts "month (in english, downcase and just 3 letters)"
month = gets.chomp
puts "first page"
first_page = gets.chomp
puts "last page"
last_page = gets.chomp
total_pages = first_page + "-" + last_page #I have to set the number of pages, so the website can create the pdf with the complete issue to
#to download
issue = year + month
ISSUE_DIR = DATA_DIR + "/" + issue
Dir.mkdir(ISSUE_DIR) unless File.exists?(ISSUE_DIR)
puts "Creating #{issue}, pages #{total_pages}"
pagina = BASE_ramparts_URL + issue + "/" + total_pages + "/" #it creates a pdf starting on the first page and ending
#on the page I set


		open(pagina) {|f|
File.open("#{ISSUE_DIR}/#{total_pages}.pdf", 'w') do |file| file.puts f.read end}  #downloads the created pdf on the 
	#DATA_DIR and gives it the year and month of the issue as the name
puts "first page"
first_page = gets.chomp
puts "last page"
last_page = gets.chomp
total_pages = first_page + "-" + last_page
puts "Creating #{issue}, pages #{total_pages}"
pagina = BASE_ramparts_URL + issue + "/" + total_pages + "/" #it creates a pdf starting on the first page and ending
#on the page I set


		open(pagina) {|f|
File.open("#{ISSUE_DIR}/#{total_pages}.pdf", 'w') do |file| file.puts f.read end}  #downloads the created pdf on the 
	#DATA_DIR and gives it the year and month of the issue as the name


puts "done"

