note
	description: "[
		Eiffel tests that can be executed by testing tool.
	]"
	author: "EiffelStudio test wizard"
	date: "$Date$"
	revision: "$Revision$"
	testing: "type/manual"

class
	TEST_SET_CANDIDATES

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
elem3: ELEMENT
cons1: CONSTRAINT
cons2: CONSTRAINT


	on_prepare

		do
			create a.make
			create tso.make
			create elem1.make ("A")
			create elem2.make ("B")
			create elem3.make ("C")
			create cons1.set_constraint (elem2, elem1)
			create cons2.set_constraint (elem1, elem3)
			tso.add_element (elem1)
			tso.add_element (elem2)
			tso.add_element (elem3)
			tso.add_constraint (cons1)
			tso.add_constraint (cons2)
			tso.create_mapping
			tso.setup_for_sorting

		end


feature -- Test routines

	test_set_candidates

		do
			tso.set_candidates
			if tso.candidates.count = 1 then
				assert("pass", True)
			else
				assert("Error", False)
			end
		end

end

