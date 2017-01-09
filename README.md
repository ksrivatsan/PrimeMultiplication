# PrimeMultiplication
Program to print first n prime numbers using stdout as a table with the first row and column of the table having the n primes, with each cell containing the product of the primes for the corresponding row and column.

Overall time complexity for this entire program is O(n^2).

Rspec file to test the functions.

# Instructions to run the program

1. Clone the repository by typing
		"https://github.com/ksrivatsan/PrimeMultiplication.git" or just download the repository

2. Open the terminal and navigate to cloned/downloaded folder.

3. Open interactive Ruby by typing 
		"irb"

4. Run the following commands
	a) "require './PrimeMultiplication.rb'"
	b) p = PrimeMultiplication.new
	c) p.run
	d) "Enter the number of primes you want: " and you can see the result.

# Instruction to run the Test Suite

1. Open the terminal and navigate to the cloned/downloaded folder.

2. Run the following command:
		"rspec PrimeMultiplicationSpec.rb"