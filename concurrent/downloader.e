note
	title: "Objects in charge of getting (simulated) email messages."
	author: "Bertrand Meyer"
	description: "[
		Also with just one instance, this class is in charge of 
		downloading email messages. We don’t really download them 
		from a network, we just simulate the process by creating 
		boring emails whose texts read “Message 1”, “Message 2” 
		and so on.
		]"

	help: "Press F1 (see Info tool, mail_client target)"

	EIS: "name=Downloader Summary", "protocol=URI", "src=https://www.eiffel.org/files/uploads/scoop_tutorial_%%282%%29.pdf#page=2&view=FitH"
	EIS: "name=Downloader Detail", "protocol=URI", "src=https://www.eiffel.org/files/uploads/scoop_tutorial_%%282%%29.pdf#page=6&view=FitH"

	target: "Concurrent"

class
	DOWNLOADER

create
	make

feature {NONE} -- Initialization
	make (c: separate CLIENT)

			-- Initialize with `c' as client.
		do
			client := c
			latest := ""
		end

feature -- Measurement

	count: INTEGER
			-- Number of messages downloaded so far

feature -- Access

	client: separate CLIENT
			 -- (Shared)client to which we are reporting.

	latest: STRING
			-- Latest message downloaded.

feature -- Status report

	is_over: BOOLEAN
			-- Are we there yet?
		do
			Result := (count = {PARAMETERS}.Max_messages)
		end

feature -- Basic operations

	download
			-- Simulate download of next email message.
		do
			count := count + 1
			latest := "Message " + count.out
			print ("Downloader adds: " + latest + "%N")
			record
		end

	record
			-- Report last message to client for recording.
		do
			separate client as c do
				c.add (latest)
			end
		end

	live
			-- Download messages repeatedly.
		local
			wait: INTEGER_64
			wait_generator: detachable GENERATOR
					-- Random generator of wait times.
		do
			from
				create wait_generator.make (Wait_range)
				wait_generator.forth
			until is_over	loop
				download

						-- Wait a bit (a randomly generated interval) before next download.
				wait_generator.forth
				wait := wait_generator.item * {PARAMETERS}.Milli
				{EXECUTION_ENVIRONMENT}.sleep (wait)
			end
		end

feature {NONE} -- Constants

	Wait_range: INTEGER = 600
			-- Upper bound of random wait, in milliseconds.


feature {NONE} -- Implementation



end
