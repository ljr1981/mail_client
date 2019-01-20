note
	title: "Representation of Shared {PARAMETERS}"
	author: "Bertrand Meyer"
	description_1: "[
		Again the end is not shown. This version generates 50 
		messages: see the declaration of Max_messages in class 
		{PARAMETERS}.
		]"
	description_2: "[
		As last touches, in the message to be
		output at the beginning of execution by CLIENT.make, 
		replace “SEQUENTIAL” by “CONCURRENT”, and for more 
		interesting results change the value of Max_messages 
		in class {PARAMETERS} from 10 to 50.
		]"

	help: "Press F1 (see Info tool, mail_client target)"

	EIS: "name=Parameters Summary", "protocol=URI", "src=https://www.eiffel.org/files/uploads/scoop_tutorial_%%282%%29.pdf#page=2&view=FitH"
	EIS: "name=Parameters Detail 1", "protocol=URI", "src=https://www.eiffel.org/files/uploads/scoop_tutorial_%%282%%29.pdf#page=4&view=FitH"
	EIS: "name=Parameters Detail 2", "protocol=URI", "src=https://www.eiffel.org/files/uploads/scoop_tutorial_%%282%%29.pdf#page=14&view=FitH"

	target: "Concurrent"

class
	PARAMETERS

feature -- Constants

	Max_messages: INTEGER = 50
			-- Number of messages to be generated

	Milli:INTEGER_64 = 1_000_000
			-- Number of nanoseconds in a millisecond. Facilitates parameterizing random wait times.


end
