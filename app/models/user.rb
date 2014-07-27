require "bcrypt"

class User < ActiveRecord::Base
	attr_accessor :password 
		#pwd represents the actual password someone is passing in from the
		#auths controller 
		#question marks in Ruby basically asks if something is true/false
		#pwd acts as a parameter
	def authenticated? pwd
		self.hashed_password == BCrypt::Engine.hash_secret(pwd, self.salt)
	end

	before_save :hash_stuff

	has_many :posts

private 
	def hash_stuff 
		self.salt = BCrypt::Engine.generate_salt 
		self.hashed_password = BCrypt::Engine.hash_secret(self.password, self.salt)
		self.password = nil
	end 

end


		#Anything above private is the public interface
		#self.salt creates a 20 character string of random shit. 
		#self.hashed_password takes the password and salt, adds them
		#together and randomizes them again
		#self.password instead of saving passwords to the database, it clear it out
		#every single time it tries to create/save a user it's gonna do stuff above