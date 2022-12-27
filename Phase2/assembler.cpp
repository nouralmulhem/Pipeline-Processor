#include <sstream>
#include <fstream>
#include <iomanip>
#include <string>
#include <iostream>
#include <algorithm>
#include <cctype>
#include <vector>
#include <bitset>

using namespace std;

vector<string> removeDupWord(string str)
{
	vector<string> arr;
	string word = "";
	for (auto x : str)
	{
		if (x == ' ')
		{
			arr.push_back(word);
			word = "";
		}
		else
		{
			word = word + x;
		}
	}
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

string getOperation(string opCode, string &func)
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
		func = "xxxx";
		return "1000";
	}
	if (opCode == "jn")
	{
		func = "xxxx";
		return "1000";
	}
	if (opCode == "jc")
	{
		func = "xxxx";
		return "1000";
	}
	if (opCode == "jmp")
	{
		func = "xxxx";
		return "1000";
	}
	if (opCode == "call")
	{
		func = "xxxx";
		return "1001";
	}
	if (opCode == "ret")
	{
		func = "xxxx";
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

void ReadFile(int number)
{
	// creating an obj of ifstream and reading the file name then opening it
	ifstream file;
	string path = "";
	path += "TestCases/TestCase" + to_string(number);
	file.open(path + "/assembly.txt");

	ofstream out;
	out.open(path + "/codeMemory.mem");

	out << "// memory data file (do not edit the following line - required for mem load use)\n";
	out << "// instance=/Fetch_TB/FetchModule/instMemory/memory\n";
	out << "// format=mti addressradix=h dataradix=s version=1.0 wordsperline=1\n";
	int index = 0;
	for (index; index < 50; index++)
	{
		char hex_string[100];
		sprintf_s(hex_string, "%x", index);
		out << hex_string << ":"
			<< " 0000000000000000\n";
	}
	if (file.is_open())
	{
		while (!file.eof())
		{
			string inst, func;
			string line;
			string inst2 = "";
			string reg, reg2;
			char hex_string[100];
			getline(file, line);
			std::transform(line.begin(), line.end(), line.begin(), ::tolower);
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
			out << inst << "\n";
			if (inst2 != "")
			{
				char hex_string[100];
				sprintf_s(hex_string, "%x", ++index);
				inst2 = decToBinary(stoi(inst2));
				out << hex_string << ": " << inst2 << "\n";
			}
			index++;
		}
		for (index; index < 1048576; index++)
		{
			char hex_string[100];
			sprintf_s(hex_string, "%x", index);
			out << hex_string << ":"
				<< " xxxxxxxxxxxxxxxx\n";
		}
		file.close(); // closing the file
	}
	else
	{
		cout << "can't open the file";
	}
}

int main(int argc, char **argv)
{
	for (int i = 1; i < stoi(argv[1]) + 1; i++)
	{
		ReadFile(i);
	}
	return 0;
}