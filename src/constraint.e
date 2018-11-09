note
	description: "Basic low-level methods for CONTRAINTS."
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

	elem_1: ELEMENT
	elem_2: ELEMENT

	set_values (input_1, input_2: ELEMENT)
			-- set the contraint
		do
			elem_1 := input_1
			elem_2 := input_2
			print ("new constraint values set%N")
		end

	print_constraint
			-- print the constraint
		do
			print ("elem_1: " + elem_1.out + "%N")
			print ("elem_2: " + elem_2.out + "%N")
		end

end
