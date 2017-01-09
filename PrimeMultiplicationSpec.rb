require './PrimeMultiplication.rb'

describe PrimeMultiplication do
	
	print_primes = PrimeMultiplication.new()
  
  it 'should check if number is prime' do
		result = expect(print_primes.is_prime?(1)).to eq(false)
		result = result ? "PASS" : "FAIL"
		print "\n Check if 1 is not prime #{result.to_s.capitalize} \n"
		result = expect(print_primes.is_prime?(277)).to eq(true)
		result = result ? "PASS" : "FAIL"
		print "\n Check if 3 is prime #{result.to_s.capitalize} \n"
  end

  it 'Check for first 4 prime numbers' do
  	print_primes.no_of_primes = 4
  	actual_output = print_primes.get_primes.drop(1)
  	expected_output = [2, 3, 5, 7]
  	result = expect(actual_output).to eq(expected_output)
  	result = result ? "PASS" : "FAIL"
  	print "\n Check first 4 prime numbers ----- actual_output = #{actual_output} == expected_output #{expected_output} #{result} \n"
  end

  it 'should check if the multiplication table data is right' do
  	print_primes.no_of_primes = 4
  	print_primes.get_primes
  	actual_output = print_primes.calculate_multiplication_table
  	expected_output = [["", 2, 3, 5, 7], [2, 4, 6, 10, 14], [3, 6, 9, 15, 21], [5, 10, 15, 25, 35], [7, 14, 21, 35, 49]]
  	result = expect(actual_output).to eq(expected_output)
  	result = result ? "PASS" : "FAIL"
  	print "\n Check first 4 prime numbers multiplication table ----- actual_output = #{actual_output} == expected_output #{expected_output} #{result} \n"
  end

  it "should check for user input" do
    input = '12'
    print_primes.stub(:gets) {input}
  	print_primes.get_user_input_for_test
  	p input
  	actual_output = print_primes.no_of_primes
  	expected_output = 12
  	result = expect(actual_output).to eq(expected_output)
  	result = result ? "PASS" : "FAIL"
  	print "user input has to be greater than 0 ----- input = #{input} output = #{expected_output} #{result}  \n"

    input = "a"
    print_primes.stub(:gets) {input}
  	print_primes.get_user_input_for_test
  	p input
  	actual_output = print_primes.no_of_primes
  	expected_output = 0
  	result = expect(actual_output).to eq(expected_output)
  	result = result ? "PASS" : "FAIL"
  	print "user input has some other character ----- input = #{input} output = #{expected_output} #{result}  \n"

    input = "-1"
    print_primes.stub(:gets) {input}
  	print_primes.get_user_input_for_test
  	p input
  	actual_output = print_primes.no_of_primes
  	expected_output = 0
  	result = expect(actual_output).to eq(expected_output)
  	result = result ? "PASS" : "FAIL"
  	print "user input is less than 0 ----- input = #{input} output = #{expected_output} #{result}  \n"
  end

end