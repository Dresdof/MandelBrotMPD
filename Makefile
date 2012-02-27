#	Makefile created by MPDM
#	and modified by Alexandre Pennetier


MPD = mpd
MPDFLAGS = 
I = ./MPDinter

.SUFFIXES:

link: all

all: sequential pif piga

sequential: $I/testSequential.o $I/Mandelbrot.o
	mpdl  -o sequential.out Mandelbrot MPDWin testSequential mpdwin.o -lX11

pif: $I/testPIF.o $I/Mandelbrot.o
	mpdl  -o pif.out Mandelbrot MPDWin testPIF mpdwin.o -lX11

piga: $I/testPIGA.o $I/Mandelbrot.o
	mpdl  -o piga.out Mandelbrot MPDWin testPIGA mpdwin.o -lX11

runSeq: sequential
	./sequential.out 

runPIF: pif
	./pif.out

runPIGA: piga
	./piga.out

$I/testSequential.o: $I/testSequential.spec $I/Mandelbrot.spec $I/Mandelbrot.o\
 testSequential.mpd
	$(MPD) $(MPDFLAGS) -b testSequential.mpd

$I/testSequential.spec: testSequential.mpd
	$(MPD) $(MPDFLAGS) -s testSequential.mpd

$I/testPIF.o: $I/testPIF.spec $I/Mandelbrot.spec $I/Mandelbrot.o\
 testPIF.mpd
	$(MPD) $(MPDFLAGS) -b testPIF.mpd

$I/testPIF.spec: testPIF.mpd
	$(MPD) $(MPDFLAGS) -s testPIF.mpd

$I/testPIGA.o: $I/testPIGA.spec $I/Mandelbrot.spec $I/Mandelbrot.o\
 testPIGA.mpd
	$(MPD) $(MPDFLAGS) -b testPIGA.mpd

$I/testPIGA.spec: testPIGA.mpd
	$(MPD) $(MPDFLAGS) -s testPIGA.mpd

$I/Mandelbrot.o: $I/Mandelbrot.spec mandelbrot-body.mpd
	$(MPD) $(MPDFLAGS) -b mandelbrot-body.mpd

$I/Mandelbrot.spec: mandelbrot.mpd
	$(MPD) $(MPDFLAGS) -s mandelbrot.mpd

clean:
	rm -rf $I 

cleanx: clean
	rm -f core pif.out
	rm -f core sequential.out
