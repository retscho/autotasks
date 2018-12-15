note
	description: "[
		Eiffel tests that can be executed by testing tool.
	]"
	author: "EiffelStudio test wizard"
	date: "$Date$"
	revision: "$Revision$"
	testing: "type/manual"

class
	TEST_ADD_MULTIPLE_ELEMENTS

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
some_elements : ARRAYED_LIST [ELEMENT]

	on_prepare
			-- <Precursor>
		do
			create a.make
			create tso.make
			create elem1.make ("A")
			create elem2.make ("B")
			create some_elements.make (0)
			some_elements.extend (elem1)
			some_elements.extend (elem2)

		end

	on_clean
			-- <Precursor>
		do
			tso.remove_element (elem1)
			tso.remove_element (elem2)
		end

feature -- Test routines

	add_multiple_elements --3.1.005_01
		do
			tso.add_multiple_elements (some_elements)
			if tso.list_of_elements.count = 2 then
				assert("pass", True)
			else
				assert("Error", False)
			end
		end

end


