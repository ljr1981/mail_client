note
	title: "Shared parameters"
	author: "Bertrand Meyer"
	description: "[

		]"

	help: "Press F1 (see Info tool, mail_client target)"



class
	PARAMETERS

feature -- Constants

	Max_messages: INTEGER = 50
			-- Number of messages to be generated

	Milli:INTEGER_64 = 1_000_000
			-- Number of nanoseconds in a millisecond. Facilitates parameterizing random wait times.


end
