note
	description: "[
		Eiffel tests that can be executed by testing tool.
	]"
	author: "EiffelStudio test wizard"
	date: "$Date$"
	revision: "$Revision$"
	testing: "type/manual"

class
	TEST_SORT_TOPOLOGICALLY

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
check_list: ARRAYED_LIST [ELEMENT]
T: BOOLEAN


	on_prepare

		do
			create a.make
			create tso.make
			create elem1.make ("A")
			create elem2.make ("B")
			create elem3.make ("C")
			create cons1.set_constraint (elem2, elem1)
			create cons2.set_constraint (elem1, elem3)
			create check_list.make (0)

			check_list.extend (elem2)
			check_list.extend (elem1)
			check_list.extend (elem3)
			tso.add_element (elem1)
			tso.add_element (elem2)
			tso.add_element (elem3)
			tso.add_constraint (cons1)
			tso.add_constraint (cons2)
			tso.create_mapping
			tso.setup_for_sorting
			tso.set_candidates
			T := TRUE

		end


feature -- Test routines

	test_sort_topologically

		do
			tso.sort_topologically
			across tso.sorted_elements as cursor loop
				tso.sorted_elements.go_i_th (cursor.cursor_index)
				check_list.go_i_th (cursor.cursor_index)
				if check_list.item /= tso.sorted_elements.item then
					T:= False
				end
			end
			if T then
				assert("pass", True)
			else
				assert("Error", False)
			end
		end

end
