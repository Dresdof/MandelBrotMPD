#	Makefile created by MPDM
#	and modified by Alexandre Pennetier

MPD = mpd
MPDFLAGS = 
I = ./MPDinter

.SUFFIXES:

link: build build-tests

build: $I/run.o $I/test.o  $I/Mandelbrot.o
	mpdl -o run.out Mandelbrot MPDWin run mpdwin.o -lX11

build-tests: $I/test.o $I/Mandelbrot.o
	mpdl -o test.out Mandelbrot MPDWin test mpdwin.o -lX11

tests: build-tests
	./test.out

mesures: build
	./run.out 

mesures-blind: build
	./run.out 111110

mesures-sequential: build
	./run.out 100001

mesures-sequential-blind: build
	./run.out 100000

mesures-pif: build
	./run.out 010001

mesures-pif-blind: build
	./run.out 010000

mesures-piga: build
	./run.out 001001

mesures-piga-blind: build
	./run.out 001000

mesures-pigc: build
	./run.out 000101

mesures-pigc-blind: build
	./run.out 000100

mesures-pst: build
	./run.out 000011

mesures-pst-blind: build
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
