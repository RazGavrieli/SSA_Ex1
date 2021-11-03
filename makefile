.PHONY:loops recursives loopd recursived all clean
CC = gcc
AR = ar
FLAGS = -Wall -g
loops: basicClassification.c advancedClassificationLoop.c main.c
	$(CC) $(FLAGS) -c basicClassification.c advancedClassificationLoop.c main.c
	$(AR) -rcs libclassloop.a basicClassification.o advancedClassificationLoop.o
	ranlib libclassloop.a

recursives: basicClassification.c advancedClassificationRecursion.c main.c
	$(CC) $(FLAGS) -c basicClassification.c advancedClassificationRecursion.c main.c
	$(AR) -rcs libclassrec.a basicClassification.o advancedClassificationRecursion.o
	ranlib libclassrec.a

loopd: basicClassification.c advancedClassificationLoop.c main.c
	$(CC) $(FLAGS) -c basicClassification.c advancedClassificationLoop.c main.c
	$(CC) $(FLAGS) -shared -o libclassloops.so basicClassification.o advancedClassificationLoop.o -lm

recursived: basicClassification.c advancedClassificationRecursion.c main.c
	$(CC) $(FLAGS) -c basicClassification.c advancedClassificationRecursion.c main.c
	$(CC) $(FLAGS) -shared -o libclassrec.so basicClassification.o advancedClassificationLoop.o -lm

mains: libclassrec.a main.o
	$(CC) $(FLAGS) main.o libclassrec.a -o mains -lm

maindloop: main.o
	$(CC) $(FLAGS) main.o ./libclassloops.so -o maindloop -lm

maindrec: main.o 
	$(CC) $(FLAGS) main.o ./libclassrec.so -o maindrec -lm

all: 
	make loops loopd recursived recursives mains maindloop maindrec

clean:
	rm -f *.o *.a *.so mains maindrec maindloop

	
	
	

# לשאול למה צריך מינוס אלאמ כשמשתמשים במתמטיקה 
# לשאול איך להשתמש בספריות דינמית וסטטית מול המצגת


# loopd: basicClassification.c advancedClassificationLoop.c 
# 	gcc -c basicClassification.c advancedClassificationLoop.c 

# maindloop: main.c loopd
# 	gcc main.c -o maindloop -libclassloop

# recur: advancedClassificationLoop.c
# 	gcc advancedClassificationLoop.c -lm

# run: a.out
# 	./a.out



