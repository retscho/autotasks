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


	make (input: STRING)
			-- set the value of element
		require
			input /= void
		do
			value := input
		--	print ("new value set%N")
		ensure
			value = input
		end

	print_element
			-- print the value of element
		do
			print (value.out + "%N")
		end


end
