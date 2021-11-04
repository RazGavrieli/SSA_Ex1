.PHONY: all clean loopd loops recursived recursives 

CC = gcc
AR = ar -rcs
FLAGS = -Wall -g

###creation of .o files:###
basicClassification.o: basicClassification.c NumClass.h
	$(CC) $(FLAGS) -c basicClassification.c
advancedClassificationLoop.o: advancedClassificationLoop.c NumClass.h
	$(CC) $(FLAGS) -c advancedClassificationLoop.c
advancedClassificationRecursion.o: advancedClassificationRecursion.c NumClass.h
	$(CC) $(FLAGS) -c advancedClassificationRecursion.c 
main.o: main.c NumClass.h
	$(CC) $(FLAGS) -c main.c

###creation of libraries:###
#static-
loops: libclassloops.a
libclassloops.a: basicClassification.o advancedClassificationLoop.o main.o
	$(AR) libclassloops.a basicClassification.o advancedClassificationLoop.o
	ranlib libclassloops.a
recursives: libclassrec.a
libclassrec.a: basicClassification.o advancedClassificationRecursion.o main.o
	$(AR) libclassrec.a basicClassification.o advancedClassificationRecursion.o
	ranlib libclassrec.a
#dynamic-
loopd: libclassloops.so
libclassloops.so: basicClassification.o advancedClassificationLoop.o main.o
	$(CC) $(FLAGS) -shared -o libclassloops.so basicClassification.o advancedClassificationLoop.o -lm
recursived: libclassrec.so
libclassrec.so: basicClassification.o advancedClassificationRecursion.o main.o
	$(CC) $(FLAGS) -shared -o libclassrec.so basicClassification.o advancedClassificationLoop.o -lm

###finished files###
mains: libclassrec.a main.o
	$(CC) $(FLAGS) main.o libclassrec.a -o mains -lm
maindloop: libclassloops.so main.o 
	$(CC) $(FLAGS) main.o ./libclassloops.so -o maindloop -lm
maindrec: libclassrec.so main.o
	$(CC) $(FLAGS) main.o ./libclassrec.so -o maindrec -lm

###utilitis###
all: loops loopd recursived recursives mains maindloop maindrec

clean:
	rm -f *.o *.a *.so mains maindrec maindloop
