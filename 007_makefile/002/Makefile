srcs := $(wildcard *.c)
objs := $(patsubst %.c, %.o, $(srcs))

dep_files := $(patsubst %.c, .%.o.d, $(srcs))
dep_files := $(wildcard $(dep_files))

CFLAGS = -Werror -I .

test: $(objs)
	gcc -o $@ $^

ifneq ($(dep_files), )
include $(dep_files)
endif

%.o:%.c
	gcc -c $(CFLAGS) -o $@ $< -MD -MF .$@.d

clean:
	rm *.o test

distclean:
	make clean
	rm $(dep_files)

.PHONY: clean distclean
