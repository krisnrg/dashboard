# dashboard
Define functions that run specific tasks using fzf menu.

##Requirements
You need fzf for this, it's a terminal fuzzy find utility

## Configuration
It's designed to work on a specific "client" folder, you can set that with the clientDir variable

## Functionality 
If you call it outside a client folder you get an fzf prompt, commands will run on that client and you will cd into that client.
If you call within client folder commands will run on that client.
If you add the -c flag commands will run on that client and it will cd into that client.
