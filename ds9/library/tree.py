import os
import re


def get_function_list(exp, start_path='.'):
    """
    input :
    - "exp" regex to look for
    - "start_path" path

    output :
    - list of occurences of the regex in all files in the path
    """
    funclist = []
    for dirpath, dirnames, filenames in os.walk(start_path):
        for f in filenames:
            fp = os.path.join(dirpath, f)
            with open(fp, 'r', errors='ignore') as file:
                for line in file:
                    if re.search(exp, line):  # search for the regular expression
                        # split the string and keep only the second word, which is the name of the function
                        funcname = line.split(' ')[1]
                        if funcname not in funclist:  # if not already, add it to the list
                            funclist.append((funcname, file.name))
    return funclist


def analyse_file(filename, funclist):
    """
    input :
     - "filename" path/name of the file to analyse
     - "funclist" list of tuples (functions and their origin file) to look for

     output :
     - dictionary of file links and their used functions
     """
    file_links = {}  # will populate this dict with the references to other files
    with open(filename, 'r', errors='ignore') as f:
        content = f.read()
        for func, origin in funclist:
            if content.find(func) != -1 and origin not in file_links:
                # if the function is in the file, and if the origin file has not been added yet, add the origin file to the list of links
                file_links[origin] = [func]
            elif content.find(func) != -1 and origin in file_links:
                file_links[origin].append(func)
    return file_links


def generate_tree(funclist, start_path='.'):
    """
    input :
    - "funclist" list of tuples (functions and their origin file) to look for
    - "start_path" the path to look in

    output :
    - dictionary of key->file and value->links
    """
    tree = {}
    for dirpath, dirnames, filenames in os.walk(start_path):
        for f in filenames:
            fp = os.path.join(dirpath, f)
            file_links = analyse_file(fp, funclist)
            tree[f] = file_links
    return tree


def pretty_print(tree):
    """
    creates a .txt file to write the tree
    """
    with open("tree.txt", "w") as output:
        for top_level_file, called_files in tree.items():
            output.write(f'-> {top_level_file}\n')
            for file, functions in called_files.items():
                output.write(f"\t|_ {file}\n")
                for func in functions:
                    output.write(f'\t\t|_ {func}\n')


if __name__ == "__main__":
    EXP = r"\bproc\b\s[A-Z]"  # Regex expression for detecting "proc FuncName"
    f = get_function_list(EXP)
    tree = generate_tree(f, '.')
    pretty_print(tree)
