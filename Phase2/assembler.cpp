#include <sstream>
#include <fstream>
#include <iomanip>
#include <string>
#include <iostream>
#include <algorithm>
#include <cctype>
#include <vector>
#include <bitset>
#include <cstdio>

using namespace std;

vector<string> removeDupWord(string str)
{

	vector<string> arr;
	vector<string> arr2;

	string word = "";
	for (auto x : str)
	{
		if (x == ' ' || x == ',')
		{
			if (word == "")continue;
			else if (word[0] == '#') return arr;
			arr.push_back(word);
			word = "";
		}
		else
		{
			word = word + x;
		}
	}
	if (word[0] == '#') return arr;
	arr.push_back(word);
	return arr;
}

string decToBinary(int n)
{
	string s = "";
	int binaryNum[16];

	for (int i = 0; i < 16; i++)
	{
		binaryNum[i] = n % 2;
		n = n / 2;
	}

	for (int j = 15; j >= 0; j--)
	{
		s += to_string(binaryNum[j]);
	}
	return s;
}


string HexToBin(string hexdec)
{
	long int i = 0;
	string value="";

	while (hexdec.length() <= 3) {
		hexdec = "0" + hexdec;
	}

	while (hexdec[i]) {

		switch (hexdec[i]) {
		case '0':
			value += "0000";
			break;
		case '1':
			value += "0001";
			break;
		case '2':
			value += "0010";
			break;
		case '3':
			value += "0011";
			break;
		case '4':
			value += "0100";
			break;
		case '5':
			value += "0101";
			break;
		case '6':
			value += "0110";
			break;
		case '7':
			value += "0111";
			break;
		case '8':
			value += "1000";
			break;
		case '9':
			value += "1001";
			break;
		case 'A':
		case 'a':
			value += "1010";
			break;
		case 'B':
		case 'b':
			value += "1011";
			break;
		case 'C':
		case 'c':
			value += "1100";
			break;
		case 'D':
		case 'd':
			value += "1101";
			break;
		case 'E':
		case 'e':
			value += "1110";
			break;
		case 'F':
		case 'f':
			value += "1111";
			break;
		default:
			cout << "\nInvalid hexadecimal digit "
				<< hexdec[i];
		}
		i++;
	}
	return value;
}

string getOperation(string opCode, string& func)
{
	if (opCode == "nop")
	{
		func = "0000";
		return "0000";
	}
	if (opCode == "clrc")
	{
		func = "1001";
		return "0001";
	}
	if (opCode == "setc")
	{
		func = "1010";
		return "0001";
	}
	if (opCode == "not")
	{
		func = "0001";
		return "0010";
	}
	if (opCode == "inc")
	{
		func = "0111";
		return "0010";
	}
	if (opCode == "dec")
	{
		func = "1000";
		return "0010";
	}
	if (opCode == "out")
	{
		func = "0000";
		return "0011";
	}
	if (opCode == "in")
	{
		func = "0000";
		return "0100";
	}
	if (opCode == "mov")
	{
		func = "0011";
		return "0010";
	}
	if (opCode == "add")
	{
		func = "0010";
		return "0010";
	}
	if (opCode == "sub")
	{
		func = "0100";
		return "0010";
	}
	if (opCode == "and")
	{
		func = "0101";
		return "0010";
	}
	if (opCode == "or")
	{
		func = "0110";
		return "0010";
	}
	if (opCode == "shl")
	{
		func = "1011";
		return "0101";
	}
	if (opCode == "shr")
	{
		func = "1100";
		return "0101";
	}
	if (opCode == "push")
	{
		func = "0000";
		return "0110";
	}
	if (opCode == "pop")
	{
		func = "0000";
		return "0111";
	}
	if (opCode == "ldm")
	{
		func = "0011";
		return "0101";
	}
	if (opCode == "ldd")
	{
		func = "0011";
		return "1011";
	}
	if (opCode == "std")
	{
		func = "0011";
		return "1100";
	}
	if (opCode == "jz")
	{
		func = "0000";
		return "1000";
	}
	if (opCode == "jn")
	{
		func = "0010";
		return "1000";
	}
	if (opCode == "jc")
	{
		func = "0001";
		return "1000";
	}
	if (opCode == "jmp")
	{
		func = "0011";
		return "1000";
	}
	if (opCode == "call")
	{
		func = "0011";
		return "1001";
	}
	if (opCode == "ret")
	{
		func = "0000";
		return "1010";
	}
	if (opCode == "rti")
	{
		func = "xxxx";
		return "1110";
	}
	return "xxxx";
}

string getRegister(string reg)
{
	if (reg == "r0")
		return "000";
	if (reg == "r1")
		return "001";
	if (reg == "r2")
		return "010";
	if (reg == "r3")
		return "011";
	if (reg == "r4")
		return "100";
	if (reg == "r5")
		return "101";
	if (reg == "r6")
		return "110";
	if (reg == "r7")
		return "111";
	return "-1";
}

void mergeFiles(string path){  
  fstream f1,f2,f3; 
  string str1,str2; //str1 for fetching string line from file 1 and str2 for fetching string from file2
  
  f1.open(path+"/intCode.mem",ios::in);//opening file in reading mode
  f2.open(path+"/code.mem",ios::in);
  f3.open(path+"/codeMemory.mem",ios::out);//opening file in writing mode

   while(getline(f1, str1)){ //read lines from file object and put it into string and push back to file 3.
         f3<<str1; // inserting the fetched string inside file3
         f3<<endl;
      }

   while(getline(f2, str2)){ //Same step for file 2 to file 3 fetching
         f3<<str2;
         f3<<endl;
      }

  f1.close();
  f2.close();
  f3.close();
	string filenameDatastr = path+"/intCode.mem";
	const char* filenameData = filenameDatastr.c_str();
	string filenameMemorystr = path+"/code.mem";
	const char* filenameMemory = filenameMemorystr.c_str();
	remove(filenameData);
	remove(filenameMemory);
}

int hexadecimalToDecimal(string hexVal)
{
    int len = hexVal.size();
 
    // Initializing base value to 1, i.e 16^0
    int base = 1;
 
    int dec_val = 0;

    for (int i = len - 1; i >= 0; i--) {
        if (hexVal[i] >= '0' && hexVal[i] <= '9') {
            dec_val += (int(hexVal[i]) - 48) * base;
 
            // incrementing base by power
            base = base * 16;
        }
 
        else if (hexVal[i] >= 'A' && hexVal[i] <= 'F') {
            dec_val += (int(hexVal[i]) - 55) * base;

            base = base * 16;
        }
    }
    return dec_val;
}

void ReadFile(int number, string& path)
{
	// creating an obj of ifstream and reading the file name then opening it
	ifstream file;

	string program_code = "";
	string interrupt_code = "";

	path += "TestCases/TestCase" + to_string(number);
	file.open(path + "/assembly.txt");

	ofstream out;
	out.open(path + "/codeMemory.mem");

	// ofstream out2;
	// out2.open(path + "/code.mem");

	out << "// memory data file (do not edit the following line - required for mem load use)\n";
	out <<"// instance=/Fetch_TB/FetchModule/instMemory/memory\n";
	out << "// format=mti addressradix=h dataradix=s version=1.0 wordsperline=1\n";
	int index = 0;
	string* arr_s = new string[1048576]; 
	string add_k = ": 0000000000000000\n";
	for (int i = 0; i < 1048576; i++)
	{
		char hex_string[100];
		sprintf_s(hex_string, "%x", i);
		arr_s[i] = hex_string + add_k;
	}
	
	if (file.is_open())
	{
		int index2=0;
		bool interrupt= false;
		while (!file.eof())
		{
			string inst, func;
			string line;
			string inst2 = "";
			string reg, reg2;
			char hex_string[100];
			getline(file, line);
			std::transform(line.begin(), line.end(), line.begin(), ::tolower);
			if (line[0] == '#') continue;
			// if (line.substr(0,6) == ".org 0")  {
			// 	index = 0;
			// 	interrupt = true;
			// 	continue;
			// }
			// else if(line.substr(0,7) == ".org 20")  {
			// 	index = 32;
			// 	interrupt = false;
			// 	continue;
			// }
			if (line.substr(0,4) == ".org")  {
				vector<string> arr = removeDupWord(line);
				index = hexadecimalToDecimal(arr[1]);
				continue;
			}
			// (interrupt) && index2++;
			vector<string> arr = removeDupWord(line);
			sprintf_s(hex_string, "%x", index);
			inst = (string)hex_string + ": ";
			for (int i = 0; i < arr.size(); i++)
			{
				if (i == 0)
				{
					inst += getOperation(arr[i], func);
					if (arr.size() == 1)
						inst += "000000";
				}
				else if (i == 1)
				{
					reg = getRegister(arr[i]);
					inst += reg;
					if (arr.size() == 2)
						inst += reg;
				}
				else if (i == 2)
				{
					reg2 = getRegister(arr[i]);
					if (reg2 != "-1")
					{
						inst += reg2;
					}
					else
					{
						inst += reg;
						inst2 = arr[2];
					}
				}
			}
			if (arr[0] == "std")
			{
				inst = (string)hex_string + ": " + "1100" + reg2 + reg;
			}
			inst += "00" + func;
			//(interrupt == true)? interrupt_code += inst + "\n": 
			arr_s[index] = inst + "\n";
			if (inst2 != "")
			{
				char hex_string[100];
				sprintf_s(hex_string, "%x", ++index);
				if (inst2[0] == 'h') {
					inst2 = HexToBin(inst2.substr(1,inst2.length()));
				}
				else {
					inst2 = decToBinary(stoi(inst2));
				}
				string meen = (string)hex_string + ": ";
				//(interrupt == true)? interrupt_code += meen + inst2 + "\n" : 
				arr_s[index] = meen + inst2 + "\n";
			}
			index++;
		}
		// string add = ": xxxxxxxxxxxxxxxx\n";
		// for (index; index < 1048576; index++)
		// {
		// 	char hex_string[100];
		// 	sprintf_s(hex_string, "%x", index);
		// 	program_code += hex_string + add;
		// }


		// string add = ": 0000000000000000\n";
		// for (index2; index2 < 32; index2++)
		// {
		// 	char hex_string[100];
		// 	sprintf_s(hex_string, "%x", index2);
		// 	interrupt_code += hex_string + add;
		// }

		for (int i=0; i < 1048576; i++)
		{
			out<<arr_s[i];
		}

		// out<<interrupt_code<<program_code;
		file.close(); // closing the file
		// out.close(); // closing the file
		// out2.close(); // closing the file

	}
	else
	{
		cout << "can't open the file";
	}
}

int main(int argc, char** argv)
{
	for (int i = 1; i <= stoi(argv[1]) ; i++)
	{

		string filenameDatastr = "TestCases/TestCase" + to_string(i) + "/dataMemoryOut.mem";
		const char* filenameData = filenameDatastr.c_str();
		string filenameMemorystr = "TestCases/TestCase" + to_string(i) + "/RegFileOut.mem";
		const char* filenameMemory = filenameMemorystr.c_str();
		remove(filenameData);
		remove(filenameMemory);
		string path = "";
		ReadFile(i, path);
		// mergeFiles(path);
	}
	return 0;
}