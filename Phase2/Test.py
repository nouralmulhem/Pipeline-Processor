import sys
# Importing difflib
import difflib

def compareFiles(path1,path2):
    similar=True
    with open(path1) as file_1:
        file_1_text = file_1.readlines()
    
    with open(path2) as file_2:
        file_2_text = file_2.readlines()
    
    # Find and print the diff:
    for line in difflib.unified_diff(
            file_1_text, file_2_text, fromfile='RegFileOutTested.mem',
            tofile='RegFileOut.mem', lineterm=''):
        print(line)
        similar=False

    return similar

def runTestCase(testCaseNo):
    #Run A test Case
    print("========================TestCase("+str(testCaseNo)+")============================")

    # Same Code Memory
    if(not compareFiles(path1='./TestCases/TestCase'+str(testCaseNo)+'/Tested/codeMemoryTested.mem',path2='./TestCases/TestCase'+str(testCaseNo)+'/codeMemory.mem')):
        print("Warning: Reading Different Code Memory :(")
        return False

    # Same Initial Data Memory
    if(not compareFiles(path1='./TestCases/TestCase'+str(testCaseNo)+'/Tested/dataMemoryTested.mem',path2='./TestCases/TestCase'+str(testCaseNo)+'/dataMemory.mem')):
        print("Warning: Reading Different Data Memory :(")
        return False

    # Same Regilster File 
    if(not compareFiles(path1='./TestCases/TestCase'+str(testCaseNo)+'/Tested/RegFileTested.mem',path2='./TestCases/TestCase'+str(testCaseNo)+'/RegFile.mem')):
        print("Warning: Reading Different Register File :(")
        return False

    # Same Final Register File Memory
    if(not compareFiles(path1='./TestCases/TestCase'+str(testCaseNo)+'/Tested/RegFileOutTested.mem',path2='./TestCases/TestCase'+str(testCaseNo)+'/RegFileOut.mem')):
        print("Error: Different Final Register File Memory :(")
        return False
    
    # Same Final Data Memory
    if(not compareFiles(path1='./TestCases/TestCase'+str(testCaseNo)+'/Tested/dataMemoryOutTested.mem',path2='./TestCases/TestCase'+str(testCaseNo)+'/dataMemoryOut.mem')):
        print("Error: Different Final Data Memory :(")
        return False

    return True

#Run All Test Cases
def RunTest(TestCasesCount):
    FailedTestCases = []
    for i in range(TestCasesCount):
        result=runTestCase(i+1)
        if(not result):
            FailedTestCases.append(i+1)
    
    print("Test Results:")
    if(len(FailedTestCases)==0):
        print("All Test Cases Passed Sucessfully :)")
    else:
        print("Failed Test Cases"+str(FailedTestCases))
    return


############################################################################################################################################
# python test.py 2
RunTest(int(sys.argv[1]))
