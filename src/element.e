note
	description: "Basic low-level methods for ELEMENTS."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	ELEMENT

create
	make

feature

	value: ANY

	make
		do
			value := -1 -- Initialize every elem to -1 at the beginning
			print ("new element created%N")
		end

	set_element (input: ANY)
			-- set the value of element
		do
			value := input
			print ("new value set%N")
		end

	print_element
			-- print the value of element
		do
			print (value.out + "%N")
		end


end
