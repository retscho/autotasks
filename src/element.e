note
	description: "Summary description for {ELEMENT}."
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

	set_value (input: ANY)
	do
		value := input
		print ("new value set%N")
	end

	print_value
	do
		print (value.out + "%N")
	end


end
