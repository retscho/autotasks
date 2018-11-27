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


	make
			-- Run application.
		do

			create list_of_elements.make(0) -- init (empty) list
			create list_of_constraints.make(0) -- init (empty) list

		end


	create_new_element (input: ANY) : ELEMENT
			-- create and returns new ELEMENT object
		local
			new_elem: ELEMENT
		do
			create new_elem.make
			new_elem.set_element(input)
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
		do

		end


	add_multiple_constraints (list: ARRAYED_LIST [CONSTRAINT])
			-- Add multiple constraints to the list of constraints (3.1.006)
		do

		end


	remove_multiple_elements (list: ARRAYED_LIST [ELEMENT])
			-- Remove multiple elements from the list of elements (3.1.007)
		do

		end


	remove_multiple_constraints (list: ARRAYED_LIST [CONSTRAINT])
			-- Remove multiple constraints from the list of constraints (3.1.008)
		do

		end


	sort_topologically
			-- Sorts the Elements based on the constraints and saves the result (3.1.010)
		do

		end


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
			-- displays the graph (via GraphViz) (3.1.009, 3.1.011, 3.1.012)
		do

		end

end
