note
	description: "AutoTasks application root class; Initializes the default {TOPO_SORT_OBJECT}"
	date: "$Date$"
	revision: "$Revision$"

class
	APPLICATION

inherit
	ARGUMENTS_32

create
	make

feature {NONE} -- Initialization

	-- all topo sort objects are stored in this list:
	list_of_topo_sort_objects: ARRAYED_LIST [TOPO_SORT_OBJECT]

	-- default first {TOPO_SORT_OBJECT}
	topo_sort_object_1: TOPO_SORT_OBJECT


	make
		do
			create topo_sort_object_1.make -- init default TSO
			create list_of_topo_sort_objects.make(0) -- init list of TSO
			create_new_topol_sort_object -- this call creates another TSO

		end

	create_new_topo_sort_object
			-- creates new {TOPO_SORT_OBJECT} (3.1.015)
		local
			new_object : TOPO_SORT_OBJECT
		do
			create new_object.make
		end

	delete_topo_sort_object (to_delete: TOPO_SORT_OBJECT)
			-- deletes the {TOPO_SORT_OBJECT} (3.1.016)
		do

		end

	list_all_topo_sort_objects
			-- Lists all {TOPO_SORT_OBJECT} (3.1.017)
		do

		end

end


