To generate the parser, write "make" to the terminal while in this directory.
	
	$ make

This will generate the "parser" file which can be executed on its own. It is also possible to feed a file as an input as follows:
	
	$ ./parser < cs315f17_group33.test
	
To observe the syntax error detection, we suggest editing the test program slightly and copy/pasting the entire program to the terminal after writing the following:

	$ ./parser