perlpaste
=========
* * *

this is the start of a pastebin, but there's really not much here yet. perl dancer is an excellent framework, and when I have time, I'll probably come back and work on this some more.

features
--------
the pastebin currently stores input into an sqlite3 database, paste.db. the input is not sanitized at all, and you can probably crash it or wipe the database if you try hard enough. pastes can be retrieved by accessing http://0.0.0.0:3000/pastes/foo - where foo is the number of the paste's primary key. when you submit a paste, the pastebin also returns the url for your paste (with an imaginary domain, perlpaste.com) and lists the primary key. however, there have been errors recently where it returns an array, so I'll have to fix that later.

very buggy, not really usable. only useful for looking at and getting ideas, and hopefully I'll come back to this some day. 
