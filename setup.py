from distutils.core import setup, Extension
from Cython.Build import cythonize


compile_args = ['-std=c++11']

ff_module = Extension('fast_float_py',
                sources=['fast_float.pyx'],
                extra_compile_args=compile_args,
                language='c++')

setup(name="fast_float_py", ext_modules=cythonize(ff_module, compiler_directives={"language_level": 3}))
