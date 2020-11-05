import os
from typing import Dict


def find(term_to_find: str, start_path: str = '.'):
    """Finds the desired term in all the files of the desired directory. Prints the name of the files"""
    for dirpath, dirnames, filenames in os.walk(start_path):
        for f in filenames:
            fp = os.path.join(dirpath, f)
            with open(fp, 'rb') as file:
                contents = file.read()
                if contents.find(term_to_find.encode('utf-8')) != -1 and f != "find.py":
                    return(f)


def look_in_file(file):
    """ For a given file, looks into every line for the "-command" term.\n
    Returns the list of links"""
    # create an empty list of the files that are reffered to
    links = []
    # open the current file
    with open(str(file).encode('utf-8'), 'r') as f:
        # read each line one by one
        for line in f:
            # look for the term "-command" that indicates a call to a function
            if line.find("-command") != -1:
                # if the term is present, recover the name of the function to call
                func_to_find = get_func_name(line)
                # call the find() function and recover the name of the file where the function is present
                linked_file = find(func_to_find)
                # check for duplicates
                if linked_file not in links:
                    links.append(linked_file)
                if linked_file is None:
                    links.append("WARNING :" + func_to_find + " not found")
    return links


def get_func_name(line):
    """ Returns the name of the function called in the given line (assuming the given line has "-command" in it) """
    linelist = line[line.find("-command") + len("-command"):].split(' ')
    if linelist[1].startswith("[list"):  # only case where the name of the func is not directly after the -command
        func_name = linelist[2]
    else:
        func_name = linelist[1]
    # we need t remove the special characters that surround the name of the function
    return("proc " + func_name.strip("\n][}{'"+'"'))


def map(dict_of_files):
    """ Looks into every file listed in the dict provided. For each file, sets the corresponding value to a list of references"""
    for file in dict_of_files.keys():  # for each of the files above
        dict_of_files[file] = look_in_file(file)
    return(dict_of_files)


def pretty_print(tree: Dict):
    for key, values in tree.items():
        print(f'-> {key}')
        for i in values:
            print(f"\t|_{i}")


if __name__ == "__main__":
    FILES_TO_ANALYSE = {'mfile.tcl': [], 'mhelp.tcl': [], 'manalysis.tcl': [], 'mcolor.tcl': [], 'medit.tcl': [],
                        'mframe.tcl': [], 'mregion.tcl': [], 'mscale.tcl': [], 'mview.tcl': [], 'mwcs.tcl': [], 'mzoom.tcl': []}
    FILES_TO_ANALYSE = map(FILES_TO_ANALYSE)
    pretty_print(FILES_TO_ANALYSE)
