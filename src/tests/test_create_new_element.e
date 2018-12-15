note
	description: "[
		Eiffel tests that can be executed by testing tool.
	]"
	author: "EiffelStudio test wizard"
	date: "$Date$"
	revision: "$Revision$"
	testing: "type/manual"

class
	TEST_CREATE_NEW_ELEMENT

inherit
	EQA_TEST_SET
		redefine
			on_prepare
		end

feature {NONE} -- Events

a: APPLICATION
tso: TOPO_SORT_OBJECT


	on_prepare
			-- <Precursor>
		do
			create a.make
			create tso.make
		end



feature -- Test routines

	create_new_element
	do
		create_new_element
		assert("pass", True)
	end


end
