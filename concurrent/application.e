note
	title: "mail_client Application Root Class"
	author: "Bertrand Meyer"
	description: "[
		The small “root class” which starts execution by creating
		objects and calling the {CLIENT}.
		]"
	help: "Press F1 (see Info tool, mail_client target)"

	EIS: "name=Concurrent Programming in SCOOP a hands-on tutorial", "protocol=URI", "src=https://www.eiffel.org/files/uploads/scoop_tutorial_%%282%%29.pdf#page=1&view=FitH"
	EIS: "name=Concurrent Object Oriented Programming with Bertrand Meyer", "protocol=URI", "src=https://learning.acm.org/webinars/coop"
	EIS: "name=Concurrency Made Easy", "protocol=URI", "src=http://cme.ethz.ch/documents/CME.pdf#page=1&view=FitH"

	target: "Concurrent"

class
	APPLICATION

inherit
	ARGUMENTS

create
	make

feature {NONE} -- Initialization

	make
			-- Run application.
		do
			(create {CLIENT}.make).live
		end

note
	EIS: "name=Study the Concepts of SCOOP", "protocol=URI", "src=https://www.eiffel.org/doc/solutions/Concurrency"

end
