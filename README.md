
More information on this issue:
 * https://groups.google.com/forum/#!topic/golang-dev/rr8yNScB4Lg
 * https://code.google.com/p/go/issues/detail?id=7891
 * https://codereview.appspot.com/114640044/

Workaround
==========

It seems to work if the library is accessible relative to both the directory that contains the
go package that uses cgo and the location of the primary source file.

`make success` and `make successalt` build the library and make it accessible at the paths
`./lib` and `./src/lib`, using symlinks.  The `successalt` target exists because my previous testing
didn't work when the symlink pointed into the `src/lib`, but now it seems to.

To see the two failure cases, of having only one path where the library is accessible, run `make fail1`
and `make fail2`.

Hopefully this helps someone debug this issue or at least work around it until it can be addressed.
