import os
import re


def get_function_dict(exp, start_path='.'):
    """
    input :
    - "exp" regex to look for
    - "start_path" path

    output :
    - list of occurences of the regex in all files in the path
    """
    dico = {}
    for dirpath, dirnames, filenames in os.walk(start_path):
        for f in filenames:
            if f.endswith('.tcl'):
                fp = os.path.join(dirpath, f)
                with open(fp, 'r', errors='ignore') as file:
                    funclist = []
                    for line in file:
                        if re.search(exp, line):  # search for the regular expression
                            # split the string and keep only the second word, which is the name of the function
                            funcname = line.split(' ')[1]
                            if funcname not in funclist:  # if not already, add it to the list
                                funclist.append(funcname)
                dico[f] = funclist
    return dict(sorted(dico.items(), key=lambda item: item[0]))


def get_calls_dict(func_dict, start_path='.'):
    calls_dict = {}
    for dirpath, dirnames, filenames in os.walk(start_path):
        for f in filenames:
            if f.endswith('.tcl'):
                fp = os.path.join(dirpath, f)
                with open(fp, 'r', errors='ignore') as f:
                    content = f.read()
                    calls = []
                    for funclist in func_dict.values():
                        for func in funclist:
                            if content.find(func) != -1 and content.find('proc ' + func) == -1:
                                calls.append(func)
                    calls_dict[fp] = calls
    return dict(sorted(calls_dict.items(), key=lambda item: item[0]))


def pretty_print(dict, write_name):
    """
    creates a .txt file to write the tree
    """
    with open(write_name, "w") as output:
        for top_level_file, functions in dict.items():
            output.write(f'-> {top_level_file}\n')
            for function in functions:
                output.write(f"\t|_ {function}\n")


if __name__ == "__main__":
    EXP = r"\bproc\b\s[^${]\S+"  # Regex expression for detecting "proc FuncName"
    dict_of_func = get_function_dict(EXP)
    pretty_print(dict_of_func, "structure_definitions_initial.txt")
    pretty_print(get_calls_dict(dict_of_func), "structure_calls_initial.txt")

# The initial structure of the repo has been created
# Don't create a new one on the master branch
# New structure files must be created on the dev branch
