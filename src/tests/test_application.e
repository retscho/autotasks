note
	description: "[
		Eiffel tests that can be executed by testing tool.
	]"
	author: "EiffelStudio test wizard"
	date: "$Date$"
	revision: "$Revision$"
	testing: "type/manual"

class
	TEST_APPLICATION

inherit
	EQA_TEST_SET

feature -- Test routines

	test_create_new_topo_sort_object
			-- New test routine
		local
			a : APPLICATION
		do
			create a.make
			--assert ("not_implemented", False)
		end

end


