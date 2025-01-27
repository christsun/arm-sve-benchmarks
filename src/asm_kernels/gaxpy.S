    .text
    .global assembly_gaxpy
    .type assembly_gaxpy, %function

    a       .req d0
    x_ptr   .req x0
    y_ptr   .req x1
    len     .req x2

assembly_gaxpy:
    cbz     len, .end
    mov     z0.d, a
    mov     x3, xzr
    whilelo p0.d, xzr, len
    cntd    x4
.loop:
    ld1d    z1.d, p0/z, [x_ptr, x3, lsl #3]
    ld1d    z2.d, p0/z, [y_ptr, x3, lsl #3]
    fmla    z2.d, p0/m, z0.d, z1.d
    st1d    z2.d, p0, [y_ptr, x3, lsl #3]
    add     x3, x3, x4
    whilelo p0.d, x3, len
    b.mi    .loop
.end:
    ret
