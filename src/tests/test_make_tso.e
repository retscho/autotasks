note
	description: "[
		Eiffel tests that can be executed by testing tool.
	]"
	author: "EiffelStudio test wizard"
	date: "$Date$"
	revision: "$Revision$"
	testing: "type/manual"

class
	TEST_MAKE_TSO

inherit
	EQA_TEST_SET
		redefine
			on_prepare,
			on_clean
		end

feature {NONE} -- Events

	a : APPLICATION
	tso : TOPO_SORT_OBJECT

	on_prepare
			-- <Precursor>
		do
			create a.make
			create tso.make
			--assert ("not_implemented", False)
		end

	on_clean
			-- <Precursor>
		do
			--assert ("not_implemented", False)
		end

feature -- Test routines

	test_create_tso
			-- New test routine
		do
			tso := a.create_new_topo_sort_object
			assert ("always true", True)
		end

end


