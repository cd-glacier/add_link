require 'nokogiri'
require 'open-uri'
require 'pathname'
uri = "https://github.com/dit-rohm/textbook/tree/master/"

#そのフォルダに何個のmdがあるか
spring_lesson = { '01' => 2, '02' => 1, '03' => 1, '04' => 2, '05' => 3, '06' => 3, '07' => 3, '08' => 3, '09' =>2, '10' =>2 }

if ARGV[0] == "spring" then
	uri = uri +  "spring"
	lesson = spring_lesson
end

########################################################################

def get2digit(num) 
	if(num < 10) then
		num = "0" + num.to_s
		return num
	else
		return num.to_s
	end
end

title = []
previous_link = []
link = []

#リンクとmdファイル名の代入
doc = Nokogiri::HTML(open(uri))
doc.css('ol li a').each do |node|
	tmp = node[:href].split("/").last(2)
	node[:href] = "../../spring/" + tmp[0] + "/" + tmp[1]
	link << "[次へ " + node.inner_text + "](" + node[:href] + ")"
	previous_link << "[前へ " + node.inner_text + "](" + node[:href] + ")"
	title << node[:href].split("/").last
end

#リンク貼り付け
j = 0
for i in 1..10 do
	lesson[get2digit(i)].times do
		file_name = './' + ARGV[0].to_s + '/' + get2digit(i) + '/' + title[j]
		File.open(file_name, "a") do |md|
			unless i == 1 && j == 0 then
				md.puts(" ")
				md.puts(previous_link[j - 1])
			end
			unless i == 10 && lesson[get2digit(i)] == j+1 then
				md.puts(" ")
				md.puts(link[j + 1])
			end
			j += 1
		end
	end
end

