note
	description: "[
		Eiffel tests that can be executed by testing tool.
	]"
	author: "EiffelStudio test wizard"
	date: "$Date$"
	revision: "$Revision$"
	testing: "type/manual"

class
	TEST_SET_CONSTRAINT

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



	on_prepare
			-- <Precursor>
		do
			create a.make
			create tso.make
			create elem1.make ("A")
			create elem2.make ("B")
		end


feature -- Test routines

	set_constraint_test
			-- New test routine
		local
			cons: CONSTRAINT
		do
			create cons.set_constraint (elem1, elem2)
			
			assert ("pass", True)
		end

end


