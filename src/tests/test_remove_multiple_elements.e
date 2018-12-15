note
	description: "[
		Eiffel tests that can be executed by testing tool.
	]"
	author: "EiffelStudio test wizard"
	date: "$Date$"
	revision: "$Revision$"
	testing: "type/manual"

class
	TEST_REMOVE_MULTIPLE_ELEMENTS

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
			tso.add_multiple_elements (some_elements)

		end

feature -- Test routines

	remove_multiple_elements --3.1.007_01

		do
			tso.remove_multiple_elements (some_elements)
			if tso.list_of_elements.count = 0 then
				assert("pass", True)
			else
				assert("Error", False)
			end
		end

end


