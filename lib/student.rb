require 'pry'
class Student

  attr_accessor :name, :location, :twitter, :linkedin, :github, :blog, :profile_quote, :bio, :profile_url 

  @@all = []

  def initialize(student_hash)
    
    #binding.pry
   
    student_hash.each do |attributes, its_value|
      self.send(("#{attributes}="),its_value)
    end
   

    @@all << self
  end

  def self.create_from_collection(students_array)
    #binding.pry
      students_array.each do |students|
        #binding.pry
        student = self.new(students)
      end
    
  end

  def add_student_attributes(attributes_hash)
    #binding.pry
    attributes_hash.each do |attributes, its_value|
      self.send(("#{attributes}="),its_value)
      #binding.pry
    end
    
  end

  def self.all
    @@all
    
  end
end

