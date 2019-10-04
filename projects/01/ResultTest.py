def readFile(file):
    """
    this function will open and read a text file then put each line of the text as an element in the string
    :param file: a file with .txt extension
    :precondition: True
    :postcondition: the ArrayBased list is now contained the text in file.txt
    :return: None
    """
    infile = open(file, 'r')
    contents = infile.readlines()
    infile.close()
    # array = []
    # for i in range(len(contents)):
    #     row = contents[i].rstrip("\n")
    #     array.append(row)
    return contents

testOutput = readFile("Mux8way16.out")
compareOutput = readFile("Mux8way16.cmp")
print(testOutput == compareOutput)
