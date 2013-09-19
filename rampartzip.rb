require 'rubygems'
require 'open-uri'
require 'zip'
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
issue_dirzip = ISSUE_DIR + "/"
 puts "creating a .zip"
 zipfile_name = "/home/luis/ramparts/" + issue + ".zip"
Zip::File.open(zipfile_name, Zip::File::CREATE) do |zipfile|
    Dir[File.join(issue_dirzip, '**', '**')].each do |file|
      zipfile.add(file.sub(issue_dirzip, ''), file)
    end
end

puts "done"

#luis@luis-K53SD:~/ramparts$ cd ~/zip && ruby zip.rb
#directory of the files
#/home/luis/grive/the_realist/01
#directory where you want the zip
#/home/luis/grive/the_realist/
#Zip name
#teste
#creating a .zip
#/var/lib/gems/1.9.1/gems/rubyzip-1.0.0/lib/zip/entry.rb:49:in `check_name': Illegal ZipEntry name '/15.jpg', name must not start with / (Zip::ZipEntryNameError)
#	from /var/lib/gems/1.9.1/gems/rubyzip-1.0.0/lib/zip/entry.rb:55:in `initialize'
#	from /var/lib/gems/1.9.1/gems/rubyzip-1.0.0/lib/zip/file.rb:256:in `new'
#	from /var/lib/gems/1.9.1/gems/rubyzip-1.0.0/lib/zip/file.rb:256:in `add'
#	from zip.rb:12:in `block (2 levels) in <main>'
#	from zip.rb:11:in `each'
#	from zip.rb:11:in `block in <main>'
#	from /var/lib/gems/1.9.1/gems/rubyzip-1.0.0/lib/zip/file.rb:98:in `open'
#	from zip.rb:10:in `<main>'
#luis@luis-K53SD:~/zip$ ruby zip.rb
#directory of the files
#/home/luis/grive/the_realist/01/
#directory where you want the zip
#/home/luis/grive/the_realist/
#Zip name
#teste
#creating a .zip
