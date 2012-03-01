#	Makefile created by MPDM
#	and modified by Alexandre Pennetier

MPD = mpd
MPDFLAGS = 
I = ./MPDinter

.SUFFIXES:

link: build build-test

build: $I/run.o $I/test.o  $I/Mandelbrot.o
	mpdl -o run.out Mandelbrot MPDWin run mpdwin.o -lX11

build-test: $I/test.o $I/Mandelbrot.o
	mpdl -o test.out Mandelbrot MPDWin test mpdwin.o -lX11

test: build-test
	./test.out

run: build
	./run.out 

run-blind: build
	./run.out 111110

run-sequential: build
	./run.out 100001

run-sequential-blind: build
	./run.out 100000

run-pif: build
	./run.out 010001

run-pif-blind: build
	./run.out 010000

run-piga: build
	./run.out 001001

run-piga-blind: build
	./run.out 001000

run-pigc: build
	./run.out 000101

run-pigc-blind: build
	./run.out 000100

run-pst: build
	./run.out 000011

run-pst-blind: build
	./run.out 000010

$I/test.o: $I/test.spec $I/Mandelbrot.spec $I/Mandelbrot.o\
 test.mpd
	$(MPD) $(MPDFLAGS) -b test.mpd

$I/run.o: $I/run.spec $I/Mandelbrot.spec $I/Mandelbrot.o\
 run.mpd
	$(MPD) $(MPDFLAGS) -b run.mpd

$I/run.spec: run.mpd
	$(MPD) $(MPDFLAGS) -s run.mpd

$I/test.spec: test.mpd
	$(MPD) $(MPDFLAGS) -s test.mpd

$I/Mandelbrot.o: $I/Mandelbrot.spec mandelbrot-body.mpd
	$(MPD) $(MPDFLAGS) -b mandelbrot-body.mpd

$I/Mandelbrot.spec: mandelbrot.mpd
	$(MPD) $(MPDFLAGS) -s mandelbrot.mpd

clean:
	rm -rf $I 
	rm -f core *.out
