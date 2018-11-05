note
	description: "AutoTasks application root class"
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

	-- default first topo_sort_object (TSO)
	topo_sort_object_1: TOPO_SORT_OBJECT


	make
		do
			create topo_sort_object_1.make
			create list_of_topo_sort_objects.make(0)

		end

	create_new_topological_sort_object
		do
			topo_sort_object_1 := create topo_sort_object_1.make
		end

end


