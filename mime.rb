# # (1)   textual message bodies in character sets other than
# #       US-ASCII,
# #
# # (2)   an extensible set of different formats for non-textual
# #       message bodies,
# #
# # (3)   multi-part message bodies, and
# #
# # (4)   textual header information in character sets other than
# #       US-ASCII.

require 'rubygems'
require 'pry'
require 'nokogiri'
require 'open-uri'


# ##########################
# ##########################
# ##########################
      # Content Type
# ##########################
# ##########################
# ##########################
puts "\n"*5+"*"*100
puts "Content Type:"
puts "*"*100


con_file = File.open('email_files/sample_email.html')
content_find = Nokogiri::HTML(con_file)

header =  content_find.at_css('head')

content1 = content_find.at_css('meta')
content2 = content_find.at_css('meta')[:'http-equiv']
content3 = content_find.at_css('meta')[:content]

puts "\n"+"#{content1}"+"\n"*2
puts "#{content2}= #{content3}"+"\n"*5


# ##########################
# ##########################
# ##########################
  ## To: and From:  Field
# ##########################
# ##########################
# ##########################
puts "*"*100
puts "To and From Field:"
puts "*"*100



file = File.open('email_files/Original_Message.html')
html = Nokogiri::HTML(file)

head = html.at_css('head')
# puts "\n"*2+head+"\n"*2

# ##########################
table_headers = html.css('th')
#   #   #  # puts "\n"*2+table_headers.text+"\n"*2

table_data = html.css('td')
#   #   #  # puts "\n"*2+table_data.text+"\n"*2


to = html.css('th')
puts "\n"*2+to[3].text
#
to_reciever = html.css('td')
puts to_reciever[3].text+"\n"*2


from = html.css('th')
puts "\n"*2+from[2].text
#
from_sender = html.css('td')
puts from_sender[2].text+"\n"*5
#
#


# ##########################
# ##########################
# ##########################
      # Message Body
# ##########################
# ##########################
# ##########################

puts "*"*100
puts "Message Body Begin:"
puts "*"*100


file3 = File.open('email_files/postman.html')
html_file = Nokogiri::HTML(file3)

html_body = html_file.css('body').text

puts html_body

puts "*"*100
puts "Message Body End"
puts "*"*100
