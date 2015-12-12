require 'nokogiri'
require 'open-uri'
require 'pathname'
uri = "https://github.com/dit-rohm/textbook/tree/master/"

#そのフォルダに何個のmdがあるか
spring_lesson = { '01' => 2, '02' => 1, '03' => 1, '04' => 2, '05' => 3, '06' => 3, '07' => 3, '08' => 3, '09' =>2, '10' =>2 }
autumn_lesson = { '01' => 1, '02' => 1, '03' => 1, '04' => 1, '05' => 1, '06' => 1, '07' => 1, '08' => 1, '09' => 1, '10' => 1,
									'11' => 1, '12' => 1, '13' => 1, '14' => 1, '15' => 1, '16' => 1, '17' => 1}


if ARGV[0] == "spring" then
	uri = uri +  "spring"
	lesson = spring_lesson
	lesson_num = spring_lesson.length
elsif ARGV[0] == "autumn" then
	uri = uri +  "autumn"
	lesson = autumn_lesson
	lesson_num = autumn_lesson.length
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
autumn_link = []

#リンクとmdファイル名の代入
doc = Nokogiri::HTML(open(uri))
doc.css('ol li a').each do |node|
	tmp = node[:href].split("/").last(2)
	node[:href] = "../../" + ARGV[0] + "/" + tmp[0] + "/" + tmp[1]
	link << "[次へ " + node.inner_text + "](" + node[:href] + ")"
	previous_link << "[前へ " + node.inner_text + "](" + node[:href] + ")"
	title << tmp[1]
	autumn_link << tmp[0]
end

#リンク貼り付け
def putsLink
	j = 0
	for i in 1..lesson_num do
		lesson[get2digit(i)].times do

			if ARGV[0] == "autumn" then
				file_name = './' + ARGV[0].to_s + '/' + autumn_link[j] + '/' + title[j]
			elsif ARGV[0] == "spring" then 
				file_name = './' + ARGV[0].to_s + '/' + get2digit(i) + '/' + title[j]
			else 
				puts "spell miss?"
			end

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
end


