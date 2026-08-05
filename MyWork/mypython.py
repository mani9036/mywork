s = "madam"

if s == s[ : : -1]:
    print ("It is palindrome")
else:
    print ("It's not a palindrome")


----------------------------------------------------------------

num = int (input ("Enter the number"))
if num < 2:
    print("It's not a prime number")
else:
    for i in range (2, num):
        if num % i == 0 :
            print ("It's not a prime number")
        break
    else:
        print("It's a prime number") 