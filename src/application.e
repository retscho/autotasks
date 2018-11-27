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
		do
			create list_of_topo_sort_objects.make(0) -- init list of TSO
			first := create_new_topo_sort_object -- creating 3 TSO for testing
			second := create_new_topo_sort_object
			third := create_new_topo_sort_object

			list_all_topo_sort_objects -- print out all TSO

			delete_topo_sort_object(second) -- delete second TSO

			list_all_topo_sort_objects -- print out all remaining TSO

			create elem1.make -- creating 4 elements
			create elem2.make
			create elem3.make
			create elem4.make

			first.add_element (elem1) -- adding elements to first TSO
			first.add_element (elem2)
			first.add_element (elem3)
			first.add_element (elem4)

			first.show_all_elements -- print out all elements

			first.remove_element (elem4) -- deleting elem4 from first TSO
			first.show_all_elements -- print out all elements

			create cons1.set_constraint (elem1, elem2) -- create 2 constraints
			create cons2.set_constraint (elem3, elem2)
			first.add_constraint (cons1) -- add constraints to first TSO
			first.add_constraint (cons2)

			first.show_all_constraints -- print out all constraints

			first.remove_constraint (cons2) -- remove constraint from first TSO
			first.show_all_constraints -- print out all constraints



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
			print("%N successfully created new TSO%N")
		ensure
			list_of_topo_sort_objects.count = old list_of_topo_sort_objects.count + 1
		end


	delete_topo_sort_object (to_delete: TOPO_SORT_OBJECT)
			-- deletes the {TOPO_SORT_OBJECT} (3.1.016)
		require
			not list_of_topo_sort_objects.is_empty
		local
			i : INTEGER
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


