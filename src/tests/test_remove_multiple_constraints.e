note
	description: "[
		Eiffel tests that can be executed by testing tool.
	]"
	author: "EiffelStudio test wizard"
	date: "$Date$"
	revision: "$Revision$"
	testing: "type/manual"

class
	TEST_REMOVE_MULTIPLE_CONSTRAINTS

inherit
	EQA_TEST_SET
		redefine
			on_prepare
		end

feature {NONE} -- Events

a: APPLICATION
tso: TOPO_SORT_OBJECT
elem1: ELEMENT
elem2: ELEMENT
cons1: CONSTRAINT
cons2: CONSTRAINT
some_constraints: ARRAYED_LIST [CONSTRAINT]

	on_prepare

		do
			create a.make
			create tso.make
			create elem1.make ("A")
			create elem2.make ("B")
			create cons1.set_constraint (elem1, elem2)
			create cons2.set_constraint (elem2, elem1)
			create some_constraints.make (0)
			tso.add_element (elem1)
			tso.add_element (elem2)
			some_constraints.extend (cons1)
			some_constraints.extend (cons2)
			tso.add_multiple_constraints (some_constraints)
		end



feature -- Test routines

	add_multiple_constraints  --3.1.008_01
		do
			tso.remove_multiple_constraints(some_constraints)
			if tso.list_of_constraints.count = 0 then
				assert("pass", True)
			else
				assert("Error", False)
			end
		end

end


