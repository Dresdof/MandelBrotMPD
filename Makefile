#	Makefile created by MPDM


MPD = mpd
MPDFLAGS = 
I = ./MPDinter

.SUFFIXES:

link: a.out

a.out: $I/Mandelbrot.o $I/testProgram.o
	mpdl  -o a.out Mandelbrot testProgram

compile: $I/Mandelbrot.o $I/testProgram.o

run: link
	a.out 

$I/Mandelbrot.o: $I/Mandelbrot.spec mandelbrot-body.mpd
	$(MPD) $(MPDFLAGS) -b mandelbrot-body.mpd

$I/Mandelbrot.spec: mandelbrot.mpd
	$(MPD) $(MPDFLAGS) -s mandelbrot.mpd

$I/testProgram.o: $I/testProgram.spec $I/Mandelbrot.spec testProgram.mpd
	$(MPD) $(MPDFLAGS) -b testProgram.mpd

$I/testProgram.spec: testProgram.mpd
	$(MPD) $(MPDFLAGS) -s testProgram.mpd

clean:
	rm -rf $I 

cleanx: clean
	rm -f core a.out

ls:
	@echo mandelbrot-body.mpd mandelbrot.mpd testProgram.mpd

make:
	mpdm mandelbrot-body.mpd mandelbrot.mpd testProgram.mpd

