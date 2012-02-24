#	Makefile created by MPDM


MPD = mpd
MPDFLAGS = 
I = ./MPDinter

.SUFFIXES:

link: a.out

a.out: $I/testProgram.o $I/Mandelbrot.o
	mpdl  -o a.out Mandelbrot MPDWin testProgram mpdwin.o -lX11

compile: $I/testProgram.o $I/Mandelbrot.o

run: link
	a.out 

$I/testProgram.o: $I/testProgram.spec $I/Mandelbrot.spec $I/Mandelbrot.o\
 testProgram.mpd
	$(MPD) $(MPDFLAGS) -b testProgram.mpd

$I/testProgram.spec: testProgram.mpd
	$(MPD) $(MPDFLAGS) -s testProgram.mpd

$I/Mandelbrot.o: $I/Mandelbrot.spec mandelbrot-body.mpd
	$(MPD) $(MPDFLAGS) -b mandelbrot-body.mpd

$I/Mandelbrot.spec: mandelbrot.mpd
	$(MPD) $(MPDFLAGS) -s mandelbrot.mpd

clean:
	rm -rf $I 

cleanx: clean
	rm -f core a.out

ls:
	@echo testProgram.mpd mandelbrot.mpd mandelbrot-body.mpd

make:
	mpdm testProgram.mpd mandelbrot.mpd mandelbrot-body.mpd
