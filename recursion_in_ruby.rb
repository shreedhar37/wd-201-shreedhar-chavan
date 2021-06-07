# we are writing recursive code to calculate the factorial of a given number.
def factorial(n)
  if n == 0 or n == 1
    return n
  else
    return n * factorial(n -1) #recursively calling same function
  end
end

print "Enter the number: "
n = gets.to_i
print "The factorial of #{n} is: ",factorial(n)

# REMEMBER puts by default adds new line and print doesn't !!!!!
