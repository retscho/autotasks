note
	description: "[
		Eiffel tests that can be executed by testing tool.
	]"
	author: "EiffelStudio test wizard"
	date: "$Date$"
	revision: "$Revision$"
	testing: "type/manual"

class
	TEST_DELETE_TSO

inherit
	EQA_TEST_SET
		redefine
			on_prepare
		end

feature {NONE} -- Events

	a : APPLICATION
	tso1 : TOPO_SORT_OBJECT
	tso2 : TOPO_SORT_OBJECT


	on_prepare
			-- <Precursor>
		do
			create a.make
			tso1 := a.create_new_topo_sort_object
			tso2 := a.create_new_topo_sort_object

		end


feature -- Test routines

	test_delete_tso
			-- New test routine
		do
			a.delete_topo_sort_object (tso1)
			if a.list_of_topo_sort_objects.count = 2 then --2wegen DEMO
				assert ("always true", True)
			else
				assert ("Error", False)
			end
		end

end

