CC = gcc
CFLAGS = -Wall -Wextra -g -I include
AFLAGS = -march=native -mtune=native
OFLAGS = -Ofast
LDFLAGS = -lm

SRCDIR = ./src
ASMDIR = $(SRCDIR)/asm_kernels
BUILDDIR = ./target
DEPSDIR = $(BUILDDIR)/deps
TARGET = $(BUILDDIR)/arm_bench

.PHONY: build run clean

build: $(TARGET)

$(TARGET): $(DEPSDIR)/main.o $(DEPSDIR)/config.o $(DEPSDIR)/drivers.o $(DEPSDIR)/kernels.o $(DEPSDIR)/logs.o $(ASMDIR)/*.S
	$(CC) $(AFLAGS) $(CFLAGS) $(OFLAGS) $^ -o $@ $(LDFLAGS)

$(DEPSDIR)/%.o: $(SRCDIR)/%.c
	@mkdir -p $(DEPSDIR)
	$(CC) $(AFLAGS) $(CFLAGS) $(OFLAGS) $(BENCH) -c $< -o $@

clean:
	@rm -Rf $(BUILDDIR)
