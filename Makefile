#	Makefile created by MPDM
#	and modified by Alexandre Pennetier


MPD = mpd
MPDFLAGS = 
I = ./MPDinter

.SUFFIXES:

link: whole

individuals: sequential pif piga pigc pst

whole: $I/run.o $I/Mandelbrot.o
	mpdl -o run.out Mandelbrot MPDWin run mpdwin.o -lX11

sequential: $I/runSequential.o $I/Mandelbrot.o
	mpdl  -o sequential.out Mandelbrot MPDWin runSequential mpdwin.o -lX11

pif: $I/runPIF.o $I/Mandelbrot.o
	mpdl  -o pif.out Mandelbrot MPDWin runPIF mpdwin.o -lX11

piga: $I/runPIGA.o $I/Mandelbrot.o
	mpdl  -o piga.out Mandelbrot MPDWin runPIGA mpdwin.o -lX11

pigc: $I/runPIGC.o $I/Mandelbrot.o
	mpdl  -o pigc.out Mandelbrot MPDWin runPIGC mpdwin.o -lX11

pst: $I/runPST.o $I/Mandelbrot.o
	mpdl  -o pst.out Mandelbrot MPDWin runPST mpdwin.o -lX11

run: whole
	./run.out 

runSeq: sequential
	./sequential.out 

runPIF: pif
	./pif.out

runPIGA: piga
	./piga.out

runPIGC: pigc
	./pigc.out

runPST: pst
	./pst.out

$I/run.o: $I/run.spec $I/Mandelbrot.spec $I/Mandelbrot.o\
 run.mpd
	$(MPD) $(MPDFLAGS) -b run.mpd

$I/run.spec: run.mpd
	$(MPD) $(MPDFLAGS) -s run.mpd

$I/runSequential.o: $I/runSequential.spec $I/Mandelbrot.spec $I/Mandelbrot.o\
 runSequential.mpd
	$(MPD) $(MPDFLAGS) -b runSequential.mpd

$I/runSequential.spec: runSequential.mpd
	$(MPD) $(MPDFLAGS) -s runSequential.mpd

$I/runPIF.o: $I/runPIF.spec $I/Mandelbrot.spec $I/Mandelbrot.o\
 runPIF.mpd
	$(MPD) $(MPDFLAGS) -b runPIF.mpd

$I/runPIF.spec: runPIF.mpd
	$(MPD) $(MPDFLAGS) -s runPIF.mpd

$I/runPIGA.o: $I/runPIGA.spec $I/Mandelbrot.spec $I/Mandelbrot.o\
 runPIGA.mpd
	$(MPD) $(MPDFLAGS) -b runPIGA.mpd

$I/runPIGA.spec: runPIGA.mpd
	$(MPD) $(MPDFLAGS) -s runPIGA.mpd

$I/runPIGC.o: $I/runPIGC.spec $I/Mandelbrot.spec $I/Mandelbrot.o\
 runPIGC.mpd
	$(MPD) $(MPDFLAGS) -b runPIGC.mpd

$I/runPIGC.spec: runPIGC.mpd
	$(MPD) $(MPDFLAGS) -s runPIGC.mpd

$I/runPST.o: $I/runPST.spec $I/Mandelbrot.spec $I/Mandelbrot.o\
 runPST.mpd
	$(MPD) $(MPDFLAGS) -b runPST.mpd

$I/runPST.spec: runPST.mpd
	$(MPD) $(MPDFLAGS) -s runPST.mpd

$I/Mandelbrot.o: $I/Mandelbrot.spec mandelbrot-body.mpd
	$(MPD) $(MPDFLAGS) -b mandelbrot-body.mpd

$I/Mandelbrot.spec: mandelbrot.mpd
	$(MPD) $(MPDFLAGS) -s mandelbrot.mpd

clean:
	rm -rf $I 

cleanx: clean
	rm -f core pif.out
	rm -f core sequential.out
