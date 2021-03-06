#
# Logs sytem Makefile
# 2022, d3phys
#

ifeq ($(MAKELEVEL),0)
CXX      = g++ 
CXXFLAGS = $(addprefix -I, $(HPATH)) $(LOGSFLAGS) $(TXFLAGS)

LOGS_FILE = logsl.html
LOGSFLAGS = -D LOGS_COLORS -D LOGS_FILE='"$(LOGS_FILE)"'
endif

# Header files
HPATH = ./

logs.o: logs.cpp
	$(CXX) $(addprefix -I, $(HPATH)) $(CXXFLAGS) -c logs.cpp -o logs.o	

test: logs.o test/main.o
	$(CXX) $(CXXFLAGS) logs.o test/main.o -o bin

dep:
	@sed '/\#\#\# Dependencies \#\#\#/q' < Makefile > temp_make
	@if [[ "$(wildcard *.cpp)" != "" ]]; then $(CPP) -MM *.cpp $(addprefix -I, $(HPATH)) >> temp_make; fi
	@cp temp_make Makefile
	@rm temp_make

rmdep:
	@sed '/\#\#\# Dependencies \#\#\#/q' < Makefile > temp_make
	@cp temp_make Makefile
	@rm temp_make

clean:
	@rm -f *.o
	@rm -f test/*.o
	@rm -f bin
	@rm -f $(LOGS_FILE)

.PHONY: make clean test

#
# Awesome flags collection
# Copyright (C) 2021, 2022 ded32, the TXLib creator
#
TXFLAGS =  -g --static-pie -std=c++14 -fmax-errors=100 -Wall -Wextra       \
	   -Weffc++ -Waggressive-loop-optimizations -Wc++0x-compat 	   \
	   -Wc++11-compat -Wc++14-compat -Wcast-align -Wcast-qual 	   \
	   -Wchar-subscripts -Wconditionally-supported -Wconversion        \
	   -Wctor-dtor-privacy -Wempty-body -Wfloat-equal 		   \
	   -Wformat-nonliteral -Wformat-security -Wformat-signedness       \
	   -Wformat=2 -Winline -Wlarger-than=8192 -Wlogical-op 	           \
	   -Wmissing-declarations -Wnon-virtual-dtor -Wopenmp-simd 	   \
	   -Woverloaded-virtual -Wpacked -Wpointer-arith -Wredundant-decls \
	   -Wshadow -Wsign-conversion -Wsign-promo -Wstack-usage=8192      \
	   -Wstrict-null-sentinel -Wstrict-overflow=2 			   \
	   -Wsuggest-attribute=noreturn -Wsuggest-final-methods 	   \
	   -Wsuggest-final-types -Wsuggest-override -Wswitch-default 	   \
	   -Wswitch-enum -Wsync-nand -Wundef -Wunreachable-code -Wunused   \
	   -Wuseless-cast -Wvariadic-macros -Wno-literal-suffix 	   \
	   -Wno-missing-field-initializers -Wno-narrowing 	           \
	   -Wno-old-style-cast -Wno-varargs -fcheck-new 		   \
	   -fsized-deallocation -fstack-check -fstack-protector            \
	   -fstrict-overflow -flto-odr-type-merging 	   		   \
	   -fno-omit-frame-pointer                                         \
	   -fPIE                                                           \
	   -fsanitize=address 	                                           \
	   -fsanitize=alignment                                            \
	   -fsanitize=bool                                                 \
 	   -fsanitize=bounds                                               \
	   -fsanitize=enum                                                 \
	   -fsanitize=float-cast-overflow 	                           \
	   -fsanitize=float-divide-by-zero 			           \
	   -fsanitize=integer-divide-by-zero                               \
	   -fsanitize=leak 	                                           \
	   -fsanitize=nonnull-attribute                                    \
	   -fsanitize=null 	                                           \
	   -fsanitize=object-size                                          \
	   -fsanitize=return 		                                   \
	   -fsanitize=returns-nonnull-attribute                            \
	   -fsanitize=shift                                                \
	   -fsanitize=signed-integer-overflow                              \
	   -fsanitize=undefined                                            \
	   -fsanitize=unreachable                                          \
	   -fsanitize=vla-bound                                            \
	   -fsanitize=vptr                                                 \
	   -lm -pie                                          

### Dependencies ###
