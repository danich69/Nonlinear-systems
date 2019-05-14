execute: prog
	./prog
prog: main.o non_linear_systems.o  func.o linear_system.o
	gfortran $^ -o $@ -g
main.o: main.f90 non_linear_systems.o func.o
	gfortran $^ -c -g
non_linear_systems.mod non_linear_systems.o: non_linear_systems.f90 func.f90 linear_system.o
	gfortran $^ -c -g
linear_system.mod linear_system.o: linear_system.f90
	gfortran $^ -c -g
data: ./creator
	./creator
./creator: creator.f90
	gfortran creator.f90 -o creator
clean: 
	rm -f *.o *mod
graph: result.dat
	gnuplot plot_un.gnu
