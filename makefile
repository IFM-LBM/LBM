
main : variables.o main.o
	gfortran -o lbm main.o variables.o -L /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.12.sdk/usr/lib/

main.o : main.f90
	gfortran -O -c -Wall main.f90

variables.o : variables.f90
	gfortran -O -c -Wall variables.f90

clean:
	rm *.o ; rm *.mod ; rm lbm

