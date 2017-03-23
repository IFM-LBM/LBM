
main : parameters.o variables.o main.o
	mpif90 -o lbm main.o parameters.o variables.o -L /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.12.sdk/usr/lib/

main.o : main.f90
	mpif90 -O -c -Wall main.f90

variables.o : variables.f90
	mpif90 -O -c -Wall variables.f90

parameters.o : parameters.f90
	mpif90 -O -c -Wall parameters.f90

clean:
	rm *.o ; rm *.mod ; rm lbm

