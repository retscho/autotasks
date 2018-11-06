note
	description: "Summary description for {TOPO_SORT_OBJECT}."
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

		create_new_element(3)

	end

	create_new_element (input: ANY)
		-- create new ELEMENT object
	local
		new_elem: ELEMENT
	do
		create new_elem.make
		new_elem.set_value(input)
	end

	add_element (elem: ELEMENT)
		-- Add an element to the list of elements (3.1.001)
	do
		list_of_elements.extend(elem) -- push element to the list
	end

	add_constraint (cons: CONSTRAINT)
		-- Add a constraint to the list of constraints (3.1.002)
	do
		list_of_constraints.extend(cons)
	end

	remove_element (elem: ELEMENT)
		-- Remove an element from the list of element (3.1.003)
	do

	end

	remove_constraint (cons: CONSTRAINT)
		-- Remove a constraint from the list of constraints (3.1.004)
	do

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
	do

	end

end
