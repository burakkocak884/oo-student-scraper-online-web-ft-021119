require 'open-uri'
require 'pry'
# require_relative './student.rb'

class Scraper

	  def self.scrape_index_page(index_url)
	   	info_list = []
	 
	  	 html = open(index_url)
	  	 document = Nokogiri::HTML(html)
	  	student = document.css(".student-card")
	  	#binding.pry
	  	student.each do |each_one|
	  		students = {}

			
	  		students[:name] = each_one.css("h4").text
	  		students[:location] = each_one.css("p").text
	  		students[:profile_url] = each_one.css("a").first["href"]
	  		#binding.pry
	  		info_list << students
	  			
	  		#binding.pry
	  	end
		info_list
	  	#binding.pry
	 end

	  def self.scrape_profile_page(profile_url)
	  	#binding.pry
	     
	   		 students = {}
	  	

			html = open(profile_url)
		  	document = Nokogiri::HTML(html)
		  	student = document.css(".social-icon-container a")
		  	student_bio = document.css(".details-container")
		  	quote = document.css(".vitals-text-container")
		  	 
            #binding.pry
		  	student.each do |each_one|
	  		
            #binding.pry
	  		if each_one.attribute("href").value.include?("twitter")
	  						students[:twitter] = each_one.attribute("href").value
	  				elsif each_one.attribute("href").value.include?("linkedin")
	  						students[:linkedin] = each_one.attribute("href").value 
	  			 	elsif each_one.attribute("href").value.include?("github")
	  			 			students[:github] = each_one.attribute("href").value
	  			 	else
	  	
	  				students[:blog] = each_one.attribute("href").value 
	  		end
	  	end
	  	
	  		
	  		    students[:profile_quote] = quote.css(".profile-quote").text 
	  		    students[:bio] = student_bio.css("p").text
	  		 
	  		 	students
	   
	   #binding.pry

	  	end

	
	end

