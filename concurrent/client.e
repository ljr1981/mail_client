note
	title: "Representation of a {CLIENT}."
	author: "Bertrand Meyer"
	description: "[
		There will be one instance of this class, representing the email client
		which coordinates between the {DOWNLOADER} and {VIEWER}.
		]"

	help: "Press F1 (see Info tool, mail_client target)"

	EIS: "name=Client Summary", "protocol=URI", "src=https://www.eiffel.org/files/uploads/scoop_tutorial_%%282%%29.pdf#page=2&view=FitH"
	EIS: "name=Client Detail", "protocol=URI", "src=https://www.eiffel.org/files/uploads/scoop_tutorial_%%282%%29.pdf#page=5&view=FitH"

	target: "Concurrent"

class CLIENT inherit

	LINKED_LIST [STRING]
		rename make as list_make redefine new_chain end

create
	make

feature {NONE} -- Initialization

	make
			-- Set up downloader and viewer.
		do
			print ("Mail client, CONCURRENT version, " + {PARAMETERS}.Max_messages.out + " messages.%N%N")
			create downloader.make (Current)
			create viewer.make (Current)
			list_make
		end

feature -- Access


	downloader: separate DOWNLOADER
			-- Downloading engine

	viewer: separate VIEWER
			-- Message viewing engine


feature -- Basic operations

	live
			-- `live' operation of Current.
		do
			separate downloader as d, viewer as v do
				d.live
				v.live
			end
		end

	add (m: separate STRING)
			-- Add a copy of `m' at end of list of messages.
		local
			l: STRING
		do
			create l.make_from_separate (m)
			extend (l)
		end


feature -- Implementation

	new_chain: like Current
			-- A newly created instance of the same type.
			-- This feature may be redefined in descendants so as to
			-- produce an adequately allocated and initialized object.
			--| The need for this declaration is an artifact of the current EiffelBase,
			--| it will go away soon.
		note
			obsolete_soon: "[
				The need for this declaration is an artifact of the 
				current 18.11 EiffelBase, it will go away soon.
				]"
		do
			create Result.make
		end

end
