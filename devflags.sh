#!/bin/bash
echo "-ansi -ggdb3 -pg -O0 -Wall -Wextra -pedantic -Wdeclaration-after-statement \
-Wshadow -Wpointer-arith -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes \
-Wno-missing-braces -Wno-missing-field-initializers -Wformat=2 \
-Wswitch-default -Wswitch-enum -Wcast-align -Wpointer-arith \
-Wbad-function-cast -Wstrict-overflow=5 -Wstrict-prototypes -Winline \
-Wundef -Wnested-externs -Wcast-qual -Wunreachable-code \
-Wlogical-op -Wfloat-equal -Wstrict-aliasing=2 -Wredundant-decls \
-Wold-style-definition -Wwrite-strings \
-fno-omit-frame-pointer -ffloat-store -fno-common -fstrict-aliasing \
-fprofile-arcs -ftest-coverage "
