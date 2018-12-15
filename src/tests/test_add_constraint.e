note
	description: "[
		Eiffel tests that can be executed by testing tool.
	]"
	author: "EiffelStudio test wizard"
	date: "$Date$"
	revision: "$Revision$"
	testing: "type/manual"

class
	TEST_ADD_CONSTRAINT

inherit
	EQA_TEST_SET
		redefine
			on_prepare,
			on_clean
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
			create cons2.set_constraint (elem1, elem1)
		end

	on_clean
			-- <Precursor>
		do
			tso.remove_constraint (cons1)
			tso.remove_element (elem1)
			tso.remove_element (elem2)
		end

feature -- Test routines

	add_constraint --3.1.002_01
			-- New test routine
		do
			tso.add_element (elem1)
			tso.add_element (elem2)
			tso.add_constraint (cons1)
			if tso.list_of_constraints.count = 1 then
				assert("pass", True)
			else
				assert("Error", False)
			end
		end

	add_selfreferred_constraint --3.1.002_02
		do
			tso.add_element (elem1)
			tso.add_element (elem2)
			tso.add_constraint (cons2)
			if tso.list_of_constraints.count = 0 then
				assert("pass", True)
			else
				assert("Error", False)
			end
		end
		
--	add_constraint_without_listed_elements --3.1.002_03
--		do
--			tso.add_constraint (cons1)
--			if tso.list_of_constraints.count = 1 then
--				assert("pass", True)
--			else
--				assert("Error", False)
--			end
--		end

	add_listed_constraintd --3.1.002_04
		do
			tso.add_element (elem1)
			tso.add_element (elem2)
			tso.add_constraint (cons1)
			tso.add_constraint (cons1)
			if tso.list_of_constraints.count = 1 then
				assert("pass", True)
			else
				assert("Error", False)
			end
		end
end


