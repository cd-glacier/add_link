require 'nokogiri'
require 'open-uri'
require 'pathname'
spring_uri = "https://github.com/dit-rohm/textbook/tree/master/spring"

########################################################################

def get2digit(num) 
	if(num < 10) then
		num = "0" + num.to_s
		return num
	else
		return num.to_s
	end
end

#そのフォルダに何個のmdがあるか
spring_lesson = { '01' => 2, '02' => 1, '03' => 1, '04' => 2, '05' => 3, '06' => 3, '07' => 3, '08' => 3, '09' =>2, '10' =>2 }
spring_title = []
spring_previous_link = []
spring_link = []

#リンクとmdファイル名の代入
doc = Nokogiri::HTML(open(spring_uri))
doc.css('ol li a').each do |node|
	tmp = node[:href].split("/").last(2)
	node[:href] = "../../spring/" + tmp[0] + "/" + tmp[1]
	spring_link << "[次へ " + node.inner_text + "](" + node[:href] + ")"
	spring_previous_link << "[前へ " + node.inner_text + "](" + node[:href] + ")"
	spring_title << node[:href].split("/").last
end

#リンク貼り付け
j = 0
for i in 1..10 do
	spring_lesson[get2digit(i)].times do
		file_name = './spring/' + get2digit(i) + '/' + spring_title[j]
		File.open(file_name, "a") do |md|
			unless i == 1 && j == 0 then
				md.puts(" ")
				md.puts(spring_previous_link[j - 1])
			end
			unless i == 10 && spring_lesson[get2digit(i)] == j+1 then
				md.puts(" ")
				md.puts(spring_link[j + 1])
			end
			j += 1
		end
	end
end

