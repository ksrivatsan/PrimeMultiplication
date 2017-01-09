class PrimeMultiplication
	
	# attribute accessors for:
	# 				prime_array stores the first n prime numbers in an array
	# 				no_of_primes stores the value of n for finding the first n prime numbers
	# 				output_array stores the resulting multiplication matrix in a 2-Dimensional Array
	attr_accessor :prime_array, :no_of_primes, :output_array

	# Get the program up and running by calling the functions in order
	def run
		get_user_input
		get_primes
    calculate_multiplication_table
    print_prime_multiples
	end

	# Get the number of primes user wants
	def get_user_input
		input_right = false
		no_of_primes = 0
		loop do
			print "Enter the number of primes you want: "
			no_of_primes = gets.chomp.to_i
			input_right = (no_of_primes.to_i > 0) ? true : false
			if no_of_primes <= 0
				print "Please enter a number( > 0 ) \n"
				self.no_of_primes = 0
			end
			break if input_right
		end
    self.no_of_primes = no_of_primes
	end

	# Same as get_user_input but for TDD to check if the program takes any other input other than a positive number
	def get_user_input_for_test
		no_of_primes = 0
		print "\n Enter value for the number of primes you want: "
		no_of_primes = gets.chomp.to_i
		if no_of_primes <= 0
			print "Please enter a number( > 0 ) \n"
			self.no_of_primes = 0
			return
		end
		self.no_of_primes = no_of_primes
	end

	# Check if a number is prime
	# Time complexity of this method is O(√n)
	def is_prime?(number)
		return false if number == 1
		(2..(Math.sqrt(number).to_i)).each do |i|
			if number % i == 0
				return false
			end
		end
		true
	end

	# Get first n prime numbers
	# Time complexity for this method is O(n√n)
  def get_primes
  	self.prime_array = [""]
		self.output_array = []
    n = 2
    loop do
	    if is_prime?(n)
    		prime_array << n
    	end
    	n = n + 1
    	break if prime_array.length == no_of_primes+1
   	end
   	return prime_array
  end

  # calculate the Multiplication matrix for the prime numbers
  # Time complexity for this method is O(n^2)
  def calculate_multiplication_table
  	prime_array.each_with_index do |element1, index1|
  		output_array[index1] = []
  		prime_array.each_with_index do |element2, index2|
	  		if(index1 == 0 && index2 == 0)
	  			output_array[index1][index2] = element1
	  		elsif (index1 == 0)
	  			output_array[index1][index2] = element2
	  		elsif (index2 == 0)
	  			output_array[index1][index2] = element1
	  		else
  				output_array[index1][index2] = element2*element1
  			end
  		end
  	end
  	return output_array
  end

  # print the Multiplication table on to the console
  def print_prime_multiples
  	tabs = "\t" * (no_of_primes/2 - 3) rescue "\t"
    print "\n #{tabs} Multiplication Table for first #{no_of_primes} Prime numbers \n\n"

    prime_array.length.times do |i|
  		print " _  _  _"
  	end
  	print "\n"

  	prime_array.length.times do |i|
  		if(i == 0)
  			print "| \t"
  		else
  			print "| #{ordinal(i)} \t"
  		end
  	end
  	print "|\n"
  	
  	prime_array.length.times do |i|
  		print " _  _  _"
  	end
  	print "\n"
  	
  	output_array.each do |i|
      print "\n"
  		i.each do |j|
  			print "| #{j} \t"
  		end
  		print "|\n"
  		i.each do |j|
  			print " _  _  _"
  		end
  		print "\n"
  	end
  	return
  end

  # helper method to give ordinal of a number eg. 1 should return 1st, 2 should return 2nd etc.
  def ordinal(number)
  	ending =
      case number % 100
        when 11, 12, 13 then 'th'
        else
          case number % 10
            when 1 then 'st'
            when 2 then 'nd'
            when 3 then 'rd'
            else 'th'
            end
        end
		return number.to_s + ending
  end
end