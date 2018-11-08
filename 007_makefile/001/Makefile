A = a b c
B = $(foreach f, $(A), $(f).o)
C = a b c d/
D = $(filter %/, $C)
E = $(filter-out %/, $C)

F = a.c b.c c.c d.c abc
G = $(wildcard $(F))
#G = $(wildcard *.c) # 将匹配当前目录所有 .c 文件

H = $(patsubst %.c, %.o, $(G))

all:
	@echo B = $B
	@echo D = $(D)
	@echo E = $(E)
	@echo G = $(G) # abc 文件不存在，所以不会被匹配上
	@echo H = $(H)
