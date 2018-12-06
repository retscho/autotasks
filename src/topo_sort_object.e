note
	description: "Handles all manipulations to a {TOPO_SORT_OBJECT} object."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	TOPO_SORT_OBJECT

create
	make

feature -- Initialization

	-- setting variables
	list_of_elements: ARRAYED_LIST [ELEMENT]
	list_of_constraints: ARRAYED_LIST [CONSTRAINT]

-- THE VARIABLES HERE ARE USED FOR ELEMENT <-> INTEGER MAPPING AND META-STUFF.
	sorted_elements: ARRAYED_LIST [ELEMENT] -- in here will be the resulting sorted list
	cycled_elements: ARRAYED_LIST [ELEMENT] -- in here will be the cycled elements
	key_to_element_mapper: HASH_TABLE [ELEMENT, INTEGER] -- using integers as key to map corresponding element
	element_string_to_key_mapper: HASH_TABLE [INTEGER, STRING] -- using value of the elements as key to map to the corresponding integer.


-- THE VARIABLES HERE ARE USED FOR THE ACTUAL SORTING ALGORITHM BY RETO.	
	sorted_integers: ARRAYED_LIST [INTEGER] -- this is the result of the sorting of the mapped integers
	cycled_integers: ARRAYED_LIST[INTEGER] -- list with mapped integers of the elements in a cycle
	candidates: LINKED_QUEUE [INTEGER] -- queue with all candidates
	successor: HASH_TABLE [LINKED_LIST[INTEGER], INTEGER] -- successor hash_table
	pred_count: HASH_TABLE [INTEGER, INTEGER] -- pred_count for every element
	freed: INTEGER
	next: INTEGER
	cycle_detector: BOOLEAN

	make
			-- Run application.
		do

			create list_of_elements.make(0) -- init (empty) list
			create list_of_constraints.make(0) -- init (empty) list

			create sorted_elements.make (0)
			create cycled_elements.make (0)
			create key_to_element_mapper.make (3)
			create element_string_to_key_mapper.make (3)

			create sorted_integers.make (0)
			create cycled_integers.make (0)
			create candidates.make
			create successor.make (3)
			create pred_count.make (3)

		end


	create_new_element (input: ANY) : ELEMENT
			-- create and returns new ELEMENT object
		local
			new_elem: ELEMENT
		do
			create new_elem.make(input)
			print("%Ncreated new element%N")
			Result := new_elem
		end


	add_element (elem: ELEMENT)
			-- Add an element to the list of elements (3.1.001)
		require
			list_of_elements.extendible and not list_of_elements.has(elem)
		do
			list_of_elements.extend(elem) -- push element to the list
		ensure
			list_of_elements.count = old list_of_elements.count + 1
		end


	add_constraint (cons: CONSTRAINT)
			-- Add a constraint to the list of constraints (3.1.002)
		require
			list_of_constraints.extendible and not list_of_constraints.has(cons)
		do
			list_of_constraints.extend(cons)
		ensure
			list_of_constraints.count = old list_of_constraints.count + 1
		end


	remove_element (to_delete: ELEMENT)
			-- Remove an element from the list of element (3.1.003)
		require
			not list_of_elements.is_empty and to_delete /= void
		local
			index_to_delete : INTEGER
		do
			across list_of_elements as cursor loop
				if
					cursor.item = to_delete
				then
					index_to_delete := cursor.cursor_index
				end
			end
			list_of_elements.go_i_th (index_to_delete)
			list_of_elements.remove
			print("%N successfully deleted element%N")
		ensure
			list_of_elements.count = old list_of_elements.count - 1
		end



	remove_constraint (to_delete: CONSTRAINT)
			-- Remove a constraint from the list of constraints (3.1.004)
		require
			not list_of_constraints.is_empty and to_delete /= void
		local
			index_to_delete : INTEGER
		do
			across list_of_constraints as cursor loop
				if
					cursor.item = to_delete
				then
					index_to_delete := cursor.cursor_index
				end
			end
			list_of_constraints.go_i_th (index_to_delete)
			list_of_constraints.remove
			print("%N successfully deleted constraint%N")
		ensure
			list_of_constraints.count = old list_of_constraints.count - 1
		end

		add_multiple_elements (list: ARRAYED_LIST [ELEMENT])
			-- Add multiple elements to the list of elements (3.1.005)
		require
			list /= void and list.count >= 1
		do
			across list as cursor loop
				add_element(cursor.item)
			end
		end


	add_multiple_constraints (list: ARRAYED_LIST [CONSTRAINT])
			-- Add multiple constraints to the list of constraints (3.1.006)
		require
			list /= void and list.count >= 1
		do
			across list as cursor loop
				add_constraint(cursor.item)
			end
		end


	remove_multiple_elements (list: ARRAYED_LIST [ELEMENT])
			-- Remove multiple elements from the list of elements (3.1.007)
		do

		end


	remove_multiple_constraints (list: ARRAYED_LIST [CONSTRAINT])
			-- Remove multiple constraints from the list of constraints (3.1.008)
		do

		end

-- ###########################################################################################################
	sort_topologically
			-- Sorts the Elements based on the constraints and saves the result (3.1.010)
		local
			linked_list_of_next : LINKED_LIST [INTEGER]
		do
			create linked_list_of_next.make
			sorted_integers.wipe_out -- clearing previous results.
			sorted_elements.wipe_out
			cycled_integers.wipe_out

			cycle_detector := FALSE

			from -- sorting loop

			until
				candidates.is_empty
			loop

				next := candidates.item
				sorted_integers.extend (next)
				candidates.remove
				if attached successor.at (next) as linked_list then -- else it doesn't work because of void-safety...
					from
						linked_list.start
					until
						linked_list.after
					loop
						freed := linked_list.item
						pred_count[freed] := pred_count[freed] - 1
						if pred_count[freed] = 0 then
							candidates.put(freed)
						end
						linked_list.forth
					end
					linked_list.wipe_out
				end
			end

			across pred_count as cursor loop -- detect cycles and and list cycled elements
				if cursor.item /= 0 then
					cycle_detector := TRUE
					cycled_integers.extend (cursor.key)
				end
			end

			if cycle_detector = TRUE then
				print("%NCYCLE DETECTED! %N%NCYCLED ELEMENTS: ")
				across cycled_integers as cursor loop
					if attached key_to_element_mapper.at (cursor.item) as element then
						cycled_elements.extend (element)
						print(element.value.out + ", ")
					end
				end
			end
			print("%N%N")

			print("%NSORTING COMPLETE: %N%NSOLUTION: ")
			across sorted_integers as cursor loop
				if attached key_to_element_mapper.at (cursor.item) as element then
					sorted_elements.extend (element)
					print(element.value.out + " -> ")
				end
			end
			print("%N%N")
		end

	set_candidates
		do
			across pred_count as cursor loop
				if cursor.item = 0 then
					candidates.extend (cursor.key)
				end
			end
			print("%NSUCCESSFULLY ADDED INITIAL CANDIDATES %N")
		end



	create_mapping
			-- updates two mapping hash_tables
		do
			across list_of_elements as cursor loop
				key_to_element_mapper.put (cursor.item, cursor.cursor_index) -- 1 -> elem1, 2 -> elem2, 3 -> elem3, ...	
				element_string_to_key_mapper.put (cursor.cursor_index, cursor.item.value.out) -- "string1" -> 1, "string2" -> 2, ....
			end
			print("%NSUCCESSFULLY CREATED MAPPINGS %N")
		end


	setup_for_sorting
			-- initialize 'successors' and 'pred_count'
		local
			ind : INTEGER
			dep : INTEGER
		do
			across key_to_element_mapper as cursor loop
				pred_count.put (0, cursor.key) -- initialize pred_count hash_table with 0's
				successor.put (create {LINKED_LIST[INTEGER]}.make, cursor.key) -- initialize successor hash_table with empty linked_list
			end

			across list_of_constraints as cursor loop
				dep := element_string_to_key_mapper[cursor.item.elem_2.value.out]
				ind := element_string_to_key_mapper[cursor.item.elem_1.value.out]

				pred_count[dep] := pred_count[dep] + 1 	-- increasing pred_count
				if attached successor.at (ind) as linked_list then		-- unnötige shizzle wege attached..	
					linked_list.extend (dep)			-- extending successor	
				end
			end
			print("%NSETUP SUCCESSFUL %N")
		end

	do_whole_process
		do
			create_mapping -- do mapping (this is necessary for sorting..)
			setup_for_sorting -- more setup..
			set_candidates -- final setup step
			sort_topologically -- actual sorting!
		end



-- ###########################################################################################################



	show_all_constraints
			-- prints all constraints (3.1.013)
		require
			list_of_constraints /= void
		local
			count : INTEGER
		do
			count := list_of_constraints.count
			print("%N--- There are " + count.out + " constraints ---%N")
			across list_of_constraints as cursor loop
				print(cursor.item)
			end
		end


	show_all_elements
			-- prints all elements
		require
			list_of_elements /= void
		local
			count : INTEGER
		do
			count := list_of_elements.count
			print("%N--- There are " + count.out + " elements ---%N")
			across list_of_elements as cursor loop
				print(cursor.item)
			end
		end


	display_graph
			-- generate graphical output of sorted graph (3.1.009, 3.1.011, 3.1.012)
	local
		solution: STRING
	do
		create solution.make_empty

		across list_of_elements as cursor
			loop

				--print(cursor.item.out)
				solution.append_string(cursor.item.out)
				solution.append("->")
			end
			solution.remove_tail (2)

--	   	create dotfile.make_open_write("topsortgv.dot")
--	   	dotfile.put_string("digraph G {"+solution +";}")

--	    {EXECUTION_ENVIRONMENT}.launch("dot -Tpng -otopsort.png topsortgv.dot")
--	    {EXECUTION_ENVIRONMENT}.launch("xdg-open topsort.png")
--	  	 print("Topological Graph has been created!")
	  	 end
--	 	dotfile: PLAIN_TEXT_FILE

end
