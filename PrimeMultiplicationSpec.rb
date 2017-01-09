require './PrimeMultiplication.rb'

describe PrimeMultiplication do
	
	print_primes = PrimeMultiplication.new()
  
  it 'should check if number is prime or not' do
    input_array = [1, 277]
    expected_output_array = [false, true]
    
    print "\n TEST for Prime Number Check \n"

    input_array.each_with_index do |input, i|
      result = expect(print_primes.is_prime?(input)).to eq(expected_output_array[i])
      result = result ? "PASS" : "FAIL"
      print "\n \tCheck if number is prime ----- input = #{input} output = #{expected_output_array[i]} #{result.to_s.capitalize} \n"
    end
  end

  it 'should check for first 4 prime numbers' do
    input_array = [4, 9]
    expected_output_array = [[2, 3, 5, 7], [2, 3, 5, 7, 11, 13, 17, 19, 23]]
  	
    print "\n TEST for first N primes \n"

    input_array.each_with_index do |input, i|
      print_primes.no_of_primes = input
      actual_output = print_primes.get_primes.drop(1)
      expected_output = expected_output_array[i]
      result = expect(actual_output).to eq(expected_output)
      result = result ? "PASS" : "FAIL"
      print "\n \t Check first #{input} prime numbers ----- actual_output => #{actual_output} == expected_output => #{expected_output} #{result} \n"
    end
  end

  it "should check for user input" do
    input_array = ["12", "a", "-1"]
    output_array = [12, 0, 0]
    test_cases = ["user input has to be greater than 0", "user input has some other character", "user input is less than 0"]
    
    print "\n TEST for User Input \n"

    input_array.each_with_index do |input, i|
      print_primes.stub(:gets) {input}
      print_primes.get_user_input_for_test
      p input
      actual_output = print_primes.no_of_primes
      expected_output = output_array[i]
      result = expect(actual_output).to eq(expected_output)
      result = result ? "PASS" : "FAIL"
      print "\t #{test_cases[i]} ----- input = #{input} output = #{expected_output} #{result}  \n"
    end
  end

  it "should check if ordinals numbers are right" do
    input_array = [3, 22, 35, 51]
    expected_output_array = ["3rd", "22nd", "35th", "51st"]
    
    print "\n TEST for Ordinals of numbers \n"

    input_array.each_with_index do |input, i|
      actual_output = print_primes.ordinal(input)
      expected_output = expected_output_array[i]
      result = expect(actual_output).to eq(expected_output)
      result = result ? "PASS" : "FAIL"
      print "\n \t Ordinal for number ----- input = #{input} output = #{expected_output} #{result}  \n"
    end
  end

  it 'should check if the multiplication matrix data is right' do
    input_array = [2, 4]
    expected_output_array = [[["", 2, 3], [2, 4, 6], [3, 6, 9]], [["", 2, 3, 5, 7], [2, 4, 6, 10, 14], [3, 6, 9, 15, 21], [5, 10, 15, 25, 35], [7, 14, 21, 35, 49]]]
    
    print "\n TEST for Prime multiplication matrix \n"

    input_array.each_with_index do |input, i|
      print_primes.no_of_primes = input
      print_primes.get_primes
      actual_output = print_primes.calculate_multiplication_table
      expected_output = expected_output_array[i]
      result = expect(actual_output).to eq(expected_output)
      result = result ? "PASS" : "FAIL"
      print "\n \t Check first #{input} prime numbers multiplication table ----- actual_output => #{actual_output} == expected_output #{expected_output} #{result} \n"
    end
  end

end