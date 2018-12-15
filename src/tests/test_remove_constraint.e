note
	description: "[
		Eiffel tests that can be executed by testing tool.
	]"
	author: "EiffelStudio test wizard"
	date: "$Date$"
	revision: "$Revision$"
	testing: "type/manual"

class
	TEST_REMOVE_CONSTRAINT

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

	on_prepare
			-- <Precursor>
		do
			create a.make
			create tso.make
			create elem1.make ("A")
			create elem2.make ("B")
			create cons1.set_constraint (elem1, elem2)
			create cons2.set_constraint (elem2, elem1)
			tso.add_element (elem1)
			tso.add_element (elem2)
		end


feature -- Test routines

	remove_constraint --3.1.004_01

		do
			tso.add_constraint (cons1)
			tso.remove_constraint (cons1)
			if tso.list_of_constraints.count = 0 then
				assert("pass", True)
			else
				assert("Error", False)
			end
		end

	remove_not_listed_constraint --3.1.004_02
		do
			tso.add_constraint (cons1)
			tso.add_constraint (cons2)
			tso.remove_constraint (cons1)
			tso.remove_constraint (cons1)
			if tso.list_of_constraints.count = 1 then
				assert("pass", True)
			else
				assert("Error", False)
			end
		end




end


