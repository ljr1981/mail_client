note
	title: "Representation of a Random Email {GENERATOR}"
	author: "Bertrand Meyer"
	description: "[
		Objects in charge of generating random numbers for simulation of email operations.
		Auxiliary classes: GENERATOR for producing random messages and waiting
		times (between downloads or views) and GLOBAL for global information.
		]"

	help: "Press F1 (see Info tool, mail_client target)"

	EIS: "name=Generator Summary", "protocol=URI", "src=https://www.eiffel.org/files/uploads/scoop_tutorial_%%282%%29.pdf#page=2&view=FitH"
	EIS: "name=Generator Detail", "protocol=URI", "src=https://www.eiffel.org/files/uploads/scoop_tutorial_%%282%%29.pdf#page=8&view=FitH"

	target: "Sequential"

class
	GENERATOR

create
	make

feature {NONE} -- Initialization

	make (n: INTEGER)
			-- Initialize integer generator for interval 1 |..| `n'.
		require
			positive: n > 0
		do
			create random.make
			random.start
			count := n
		end

feature -- Access

	count: INTEGER
			-- Upper bound of generated integers (lower bound is 1).

	item: INTEGER
			-- Last randomly generated element.
		do
			Result := (random.item \\ count) + 1
		end

feature -- Element change

	forth
			-- Produce a random integer in 1 |..| `count', available in `item'.
		do
			random.forth
		end

feature {NONE} -- Implementation

		random: RANDOM
				-- Random sequence	

invariant
	positive: count > 0
end
