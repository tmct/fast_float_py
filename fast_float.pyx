# distutils: language = c++


def parse(num_str):
    cdef char* c_num_str = num_str
    cdef double parsed = 0
    cdef from_chars_result result
    result = from_chars(c_num_str, c_num_str + len(num_str), parsed, chars_format.general)
    return float(parsed)


cdef extern from "<system_error>" namespace "std":
    cdef enum errc:
        default = 0
        invalid_argument = 22

cdef extern from "ext/fast_float/include/fast_float/fast_float.h" namespace "fast_float":
    cdef enum chars_format:
        scientific = 1<<0
        fixed = 1<<2
        hex = 1<<3
        general = fixed | scientific

    cdef struct from_chars_result:
        const char *ptr
        errc ec
        
    from_chars_result from_chars(
        const char *first,
        const char *last,
        double &value,
        chars_format fmt,
    )
