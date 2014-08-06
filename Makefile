# vim noexpandtab

help:
	@echo -e "make clean\nmake success\nmake successalt\nmake fail1\nmake fail2"

clean:
	rm -rvf lib src/lib build

build: main.go mytest.c src/mytest.go
	mkdir -p build
	gcc -c -o build/mytest.o mytest.c
	ar rcs build/libmytest.a build/mytest.o

success: clean build
	mkdir -p lib
	cp build/libmytest.a lib
	ln -s ../lib src/lib
	go run main.go

successalt: clean build
	mkdir -p src/lib
	cp build/libmytest.a src/lib
	ln -s src/lib lib
	go run main.go

fail1: clean build
	mkdir -p src/lib
	cp build/libmytest.a src/lib
	go run main.go

fail2: clean build
	mkdir -p lib
	cp build/libmytest.a lib
	go run main.go
