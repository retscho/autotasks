note
	description: "Summary description for {CONSTRAINT}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	CONSTRAINT

create
	make

feature
	make
	do
		elem_1 := -1
		elem_2 := -1
	end

	elem_1: ANY
	elem_2: ANY

	set_values (input_1, input_2: ELEMENT)
	do
		elem_1 := input_1
		elem_2 := input_2
		print ("new constraint values set%N")
	end

	print_constraint
	do
		print ("elem_1: " + elem_1.out + "%N")
		print ("elem_2: " + elem_2.out + "%N")
	end

end
