package mytest

/*
// these are equivalent
// #cgo LDFLAGS: lib/libmytest.a
#cgo LDFLAGS: -Llib -lmytest

int fortytwo();

*/
import "C"

func Call_fortytwo() int {
    return int(C.fortytwo())
}
