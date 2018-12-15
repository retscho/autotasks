note
	description: "[
		Eiffel tests that can be executed by testing tool.
	]"
	author: "EiffelStudio test wizard"
	date: "$Date$"
	revision: "$Revision$"
	testing: "type/manual"

class
	TEST_REMOVE_ELEMENT

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

	remove_element
			-- 3.1.003_01
		do
			tso.add_element (elem1)
			tso.remove_element (elem1)
			if tso.list_of_elements.count = 0 then
				assert("pass", True)
			else
				assert("Error", False)
			end
		end

	remove_not_listed_element --3.1.003_2
		do
			tso.add_element (elem2)
			tso.remove_element (elem1)
			if tso.list_of_elements.count = 1 then
				assert("pass", True)
			else
				assert("Error", False)
			end
		end


end


