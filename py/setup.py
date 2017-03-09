import os
from cx_Freeze import setup, Executable

dir_path = os.path.dirname(os.path.realpath(__file__))
cwd = os.getcwd()
# Dependencies are automatically detected, but it might need
# fine tuning.
base = 'Console'
inputFile = '1.txt'
include_files =[]
fontPath = os.path.join(dir_path, 'fonts')
for _, _, names in os.walk(fontPath):
    for name in names:
        include_files.append((os.path.join(fontPath, name), "fonts/" + name))

include_files.append((os.path.join(dir_path, inputFile), inputFile))

executables = [
    Executable('text2img.py', base=base)
]

options_build_exe = {
    'include_files':include_files,
}

setup(name='text2img',
      version = '1.0',
      description = 'tool for transforming text to images',
      options = dict(build_exe = options_build_exe),
      executables = executables)
