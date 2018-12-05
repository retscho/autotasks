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


	list_of_topo_sort_objects: ARRAYED_LIST [TOPO_SORT_OBJECT] -- all topo sort objects are stored in this list:

	make
		local
			first : TOPO_SORT_OBJECT
			second : TOPO_SORT_OBJECT
			third : TOPO_SORT_OBJECT

			elem1 : ELEMENT
			elem2 : ELEMENT
			elem3 : ELEMENT
			elem4 : ELEMENT
			temp_elem : ELEMENT

			cons1 : CONSTRAINT
			cons2 : CONSTRAINT
			cons3 : CONSTRAINT
			cons4 : CONSTRAINT

			some_elements : ARRAYED_LIST [ELEMENT]
			--some_constraints : ARRAYED_LIST [CONSTRAINT]

-- ############################ DEMO OF TOPOLOGICAL SORT ######################################
		do
			create list_of_topo_sort_objects.make(0) -- init list of TSO
			first := create_new_topo_sort_object -- creating TSO object

			create elem1.make("Arbeiten") -- creating 4 elements
			create elem2.make("Abendessen")
			create elem3.make("Aufstehen")
			create elem4.make("Mittagessen")

			first.add_element (elem1) -- adding elements to first TSO
			first.add_element (elem2)
			first.add_element (elem3)
			first.add_element (elem4)

			create cons1.set_constraint (elem3, elem1) -- create constraints
			create cons2.set_constraint (elem3, elem2)
			create cons3.set_constraint (elem3, elem4)
			create cons4.set_constraint (elem4, elem2)

			first.add_constraint (cons1) -- add constraints to first TSO
			first.add_constraint (cons2)
			first.add_constraint (cons3)
			first.add_constraint (cons4)

			first.do_whole_process -- whole process of sorting happens here!

		end

	create_new_topo_sort_object : TOPO_SORT_OBJECT
			-- creates and returns new {TOPO_SORT_OBJECT} (3.1.015)
		require
			list_of_topo_sort_objects.extendible
		local
			temp : TOPO_SORT_OBJECT
		do
			create temp.make
			Result := temp
			list_of_topo_sort_objects.extend(temp)
		--	print("%N successfully created new TSO%N")
		ensure
			list_of_topo_sort_objects.count = old list_of_topo_sort_objects.count + 1
		end


	delete_topo_sort_object (to_delete: TOPO_SORT_OBJECT)
			-- deletes the {TOPO_SORT_OBJECT} (3.1.016)
		require
			not list_of_topo_sort_objects.is_empty
		local
			index_to_delete : INTEGER
		do
			across list_of_topo_sort_objects as cursor loop
				if
					cursor.item = to_delete
				then
					index_to_delete := cursor.cursor_index
				end
			end
			list_of_topo_sort_objects.go_i_th (index_to_delete)
			list_of_topo_sort_objects.remove
			print("%N successfully deleted TSO%N")
		ensure
			list_of_topo_sort_objects.count = old list_of_topo_sort_objects.count - 1
		end


	list_all_topo_sort_objects
			-- Lists all {TOPO_SORT_OBJECT} (3.1.017)
		local
			count : INTEGER
		do
			count := list_of_topo_sort_objects.count
			print("%N--- There are " + count.out + " TSO ---%N")
			across list_of_topo_sort_objects as cursor loop
				print(cursor.item)
			end
		end
end


