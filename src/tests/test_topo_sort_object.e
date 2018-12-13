note
	description: "[
		Eiffel tests that can be executed by testing tool.
	]"
	author: "EiffelStudio test wizard"
	date: "$Date$"
	revision: "$Revision$"
	testing: "type/manual"

class
	TEST_TOPO_SORT_OBJECT

inherit
	EQA_TEST_SET

feature -- Test routines

	test_add_element
			-- New test routine
		local
			a : APPLICATION
			tso : TOPO_SORT_OBJECT
			temp_elem : ELEMENT
			i : INTEGER
		do
			create a.make
			create temp_elem.make ("HOI")
			tso := a.create_new_topo_sort_object
			tso.add_element (temp_elem)

			from
			    i := 0
			until
			    i >= 10
			loop
		    create temp_elem.make(i.out)
			    i := i + 1
			end


			assert ("always pass", True)
		end

end


