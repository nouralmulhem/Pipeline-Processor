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

    # # Same Code Memory
    # if(not compareFiles(path1='./TestCases/TestCase'+str(testCaseNo)+'/Tested/codeMemory.mem',path2='./TestCases/TestCase'+str(testCaseNo)+'/codeMemory.mem')):
    #     print("Warning: Reading Different Code Memory :(")
    #     return False

    # Same Initial Data Memory
    if(not compareFiles(path1='./TestCases/TestCase'+str(testCaseNo)+'/Tested/dataMemory.mem',path2='./TestCases/TestCase'+str(testCaseNo)+'/dataMemory.mem')):
        print("Warning: Reading Different Data Memory :(")
        return False


    # Same Final Register File Memory
    if(not compareFiles(path1='./TestCases/TestCase'+str(testCaseNo)+'/Tested/RegFileOut.mem',path2='./TestCases/TestCase'+str(testCaseNo)+'/RegFileOut.mem')):
        print("Error: Different Final Register File Memory :(")
        return False
    
    # Same Final Data Memory
    if(not compareFiles(path1='./TestCases/TestCase'+str(testCaseNo)+'/Tested/dataMemoryOut.mem',path2='./TestCases/TestCase'+str(testCaseNo)+'/dataMemoryOut.mem')):
        print("Error: Different Final Data Memory :(")
        return False

    return True

#Run All Test Cases
def RunAllTest(TestCasesCount):
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
# RunAllTest(int(sys.argv[1]))
runTestCase(int(sys.argv[1]))