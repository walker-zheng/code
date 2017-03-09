#!  /bin/python
from os import path
from os import getcwd

dir_path = path.dirname(path.realpath(__file__))
cwd = getcwd()
path_prefix = cwd if path.exists(path.join(cwd, 'fonts')) else dir_path
print(path_prefix + "\\fonts")
