#pragma once

#include <stdbool.h>
#include <stddef.h>

typedef enum bench_kind_e {
    BENCH_KIND_INIT,
    BENCH_KIND_COPY,
    BENCH_KIND_REDUC,
    BENCH_KIND_DOTPROD,
    BENCH_KIND_DAXPY,
    BENCH_KIND_SUM,
    BENCH_KIND_SCALE,
    BENCH_KIND__MAX,
} bench_kind_t;

typedef struct config_s {
    bench_kind_t benchmark_kind;
    size_t nb_bytes;
    size_t nb_iterations; 
    double error_tolerance;
    double computed_error;
    double ref_latency;
    double asm_latency;
    double speedup;
    bool passed;
} config_t;

int config_init(config_t *config, int argc, char *argv[argc + 1]);
int config_print(config_t *config);
int config_result(config_t *config);
