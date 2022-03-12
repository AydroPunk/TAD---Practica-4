CC = gcc
CFLAGS	:= -Wall -Wextra -g
# define library paths in addition to /usr/lib
LFLAGS =
# define output directory
OUTPUT	:= output
# define source directory
SRC		:= src
# define include directory
INCLUDE	:= include
# define lib directory
LIB		:= lib
ifeq ($(OS),Windows_NT)
MAIN	:= main.exe
SOURCEDIRS	:= $(SRC)
INCLUDEDIRS	:= $(INCLUDE)
LIBDIRS		:= $(LIB)
FIXPATH = $(subst /,\,$1)
RM			:= del /q /f
MD	:= mkdir
else
MAIN	:= main
SOURCEDIRS	:= $(shell find $(SRC) -type d)
INCLUDEDIRS	:= $(shell find $(INCLUDE) -type d)
LIBDIRS		:= $(shell find $(LIB) -type d)
FIXPATH = $1
RM = rm -f
MD	:= mkdir -p
endif
# define any directories containing header files other than /usr/include
INCLUDES	:= $(patsubst %,-I%, $(INCLUDEDIRS:%/=%))
# define the C libs
LIBS		:= $(patsubst %,-L%, $(LIBDIRS:%/=%))
# define the C source files
SOURCES		:= $(wildcard $(patsubst %,%/*.c, $(SOURCEDIRS)))
# define the C object files 
OBJECTS		:= $(SOURCES:.c=.o)
OUTPUTMAIN	:= $(call FIXPATH,$(OUTPUT)/$(MAIN))
all: $(OUTPUT) $(MAIN)
	@echo Executing 'all' complete!
$(OUTPUT):
	$(MD) $(OUTPUT)
$(MAIN): $(OBJECTS) 
	$(CC) $(CFLAGS) $(INCLUDES) -o $(OUTPUTMAIN) $(OBJECTS) $(LFLAGS) $(LIBS)
.c.o:
	$(CC) $(CFLAGS) $(INCLUDES) -c $<  -o $@
.PHONY: clean
clean:
	$(RM) $(OUTPUTMAIN)
	$(RM) $(call FIXPATH,$(OBJECTS))
	@echo Cleanup complete!
run: all
	./$(OUTPUTMAIN)
	@echo Executing 'run: all' complete!
	