note
	description: "[
		Eiffel tests that can be executed by testing tool.
	]"
	author: "EiffelStudio test wizard"
	date: "$Date$"
	revision: "$Revision$"
	testing: "type/manual"

class
	TEST_ADD_ELEMENT

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

	on_prepare
			-- <Precursor>
		do
			create a.make
			create tso.make
			create elem1.make ("A")
		end

	on_clean
			-- <Precursor>
		do
			tso.remove_element (elem1)
		end

feature -- Test routines

	add_element --3.1.001_01
			-- New test routine
		do
			tso.add_element (elem1)
			if tso.list_of_elements.count = 1 then
				assert("pass", True)
			else
				assert("Error", False)
			end

		end

	add_added_element --3.1.001_02
		do
			tso.add_element (elem1)
			tso.add_element (elem1)
			if tso.list_of_elements = 1 then
				assert("pass", True)
			else
				assert("Error", False)
			end

		end


end


