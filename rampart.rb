require 'rubygems'
require 'open-uri'
require 'zip'
#downloads a "Ramparts" issue you choose to your disk
def save(baso, issuo, totalo)
	pagina = baso + issuo + "/" + totalo + "/" #it creates a pdf starting on the first page and ending
#on the page I set


                open(pagina) {|f|
File.open("#{ISSUE_DIR}/#{totalo}.pdf", 'w') do |file| file.puts f.read end} #downloads the created pdf on the
        #DATA_DIR and gives it the year and month of the issue as the name
	
end
DATA_DIR = "ramparts"
Dir.mkdir(DATA_DIR) unless File.exists?(DATA_DIR)
BASE_ramparts_URL = "http://64.62.200.70/PERIODICAL/PDF/Ramparts-" #this is the site where the issues are
begin
puts "Write 'pdf' if you just want an issue in .pdf or 'zip' if you want the issue zipped"
selector = gets.chomp
if selector == "pdf"
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
save(BASE_ramparts_URL, issue, total_pages)
puts "first page"
first_page = gets.chomp
puts "last page"
last_page = gets.chomp
total_pages = first_page + "-" + last_page
puts "Creating #{issue}, pages #{total_pages}"
save(BASE_ramparts_URL, issue, total_pages)
elsif selector == "zip"
        puts "year"
year = gets.chomp
puts "month (in english, downcase and just 3 letters)"
month = gets.chomp
puts "first page"
first_page = gets.chomp
puts "last page"
last_page = gets.chomp
total_pages = first_page + "-" + last_page
issue = year + month
ISSUE_DIR = DATA_DIR + "/" + issue
Dir.mkdir(ISSUE_DIR) unless File.exists?(ISSUE_DIR)
puts "Creating #{issue}, pages #{total_pages}"
save(BASE_ramparts_URL, issue, total_pages)
puts "first page"
first_page = gets.chomp
puts "last page"
last_page = gets.chomp
total_pages = first_page + "-" + last_page
puts "Creating #{issue}, pages #{total_pages}"
save(BASE_ramparts_URL, issue, total_pages)
issue_dirzip = ISSUE_DIR + "/"
 puts "creating a .zip"
 zipfile_name = "/home/luis/ramparts/" + issue + ".zip"
Zip::ZipFile.open(zipfile_name, Zip::ZipFile::CREATE) do |zipfile|
    Dir[File.join(issue_dirzip, '**', '**')].each do |file|
      zipfile.add(file.sub(issue_dirzip, ''), file)
    end
end
else selector != "pdf" or selector != "zip"
puts "wrong option. try again"
end #if input is not "pdf" or "zip", it will ask again for input
end until selector == "pdf" or selector == "zip" #continues to ask for input until "pdf" or "zip" is introduced
puts "done"