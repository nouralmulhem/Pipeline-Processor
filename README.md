# Pipeline-Processor
Harvard (separate memories for data and instructions), RISC-like, five-stages pipeline processor.

## <img  align= center width=50px src="https://cdn.edu.buncee.com/assets/d4094ddfdc4426d73593ae3727f94eec/animation-library-flyppl-081720.gif?timestamp=1597673172">Table of Content

- <a href ="#overview">Overview</a>
  - <a href ="#Assembler">Assembler</a>
  - <a href ="#Incremental Approach">Incremental Approach</a>
  - <a href ="#All in One Batch">All in One Batch</a>
- <a href ="#started">Get Started</a>
- <a href ="#Design">Design</a>
- <a href ="#Flow Diagram">Flow Diagram</a>
- <a href ="#Instructions">Instructions</a>
- <a href ="#Demo">Demo</a>
- <a href ="#Contributors">Contributors</a>
- <a href ="#License">License</a>


## <img  align= center width=50px height=50px src="https://media3.giphy.com/media/dAoHbGjH7k5ZTeQeBI/giphy.gif"> Overview <a id = "overview"></a>
- <a href="https://github.com/BasmaElhoseny01/Pipeline-Processor/blob/main/Architecture_Project_Fall_2022_Semester.pdf">Project Description</a>
#### <a id = "Assembler">Assembler</a>

#### <a id = "Incremental Approach">Incremental Approach</a>
Following this approach we built our processor incrementally adding small modules every time to run a new instruction type. 
But how can we gauraentee that runinng new instruction doesn't cause errors in previously implmeneted instructions 🙄🙄. 
Here we thought about the idea 💡💡💡 of the Self Checking python script where we saved our previous results and every time we implment new instructions we run all test cases from the beginning to make sure no problem has occured. 
The new Results are compared to previously tested resukts as comparing text file (for Data memory and Register file). [test.py %NoOfTestCases]

#### <a id = "All in One Batch">All in One Batch</a>
All the above ideas need a too many scripts so a lot of commands are required to be types every time from compiling assembler file to running it for every test case to running modelsim to running python script to drawing reuslted wave to saving results.
Too many commands 😱😱😱.
At this point we had a brilliant idea 🧨🧨 of running only one batch including all of the above commnads which really helped us a lot in our journy 🏔️🏝️ of Design.

<h5 align="center">One command = Running about 10 commands = Saved Time ⌛ and Effort 🤒 </h5>

## <img  align= center width=50px height=50px src="https://cdn.pixabay.com/animation/2022/07/31/06/27/06-27-17-124_512.gif">Get Started <a id = "started"></a>

<ol>
<li>Clone the repository

<br>

```
git clone https://github.com/BasmaElhoseny01/Pipeline-Processor.git
```

</li>

<li>Make New Folder for your testcase

<br>

```
cd Phase2/TestCases
mkdir TestCase%NoOfTestCase
cd TestCase%NoOfTestCase
```

</li>

<li>Put your assembly code in assembly.txt

<br>

```
type nul > assembly.txt
```

</li>

<li>Run All Test Cases :D

<br>

```
cd ../..
run.bat %NoOfTestCase
```

</li>
</ol>


## <img  align= center width=50px height=50px src="https://media4.giphy.com/media/dBrimLDKab9TPDQSd8/giphy.gif?cid=6c09b952620udc6fwlifrgx872sn8m0x9famv92i60i8gzcr&rid=giphy.gif&ct=s"> Design <a id = "Design"></a>

<p align="center">
<img src="" width="400px" alt="Design"/>
</p>


## <img  align= center width=50px height=50px src="https://i.pinimg.com/originals/84/b3/0c/84b30cf92e9b9804293b7d5f131ffb7d.gif"> Flow Diagram <a id = "Flow Diagram"></a>

<p align="center">
<img src="https://user-images.githubusercontent.com/72309546/217021002-34905ec5-0cc8-4046-9a3f-2fd5f0a5fd1d.jpg" width="400px" alt="Flow Diagram"/>
</p>

## <img  align= center width=50px height=50px src="https://img.genial.ly/5f91608064ad990c6ee12237/bd7195a3-a8bb-494b-8a6d-af48dd4deb4b.gif?genial&1643587200063"> Demo <a id = "Demo"></a>
Temp video

https://user-images.githubusercontent.com/72309546/217022949-786a37a3-784b-4c13-ac7f-64c27b1d07d8.mp4

## <img  align= center width=50px height=50px src="https://media1.giphy.com/media/WFZvB7VIXBgiz3oDXE/giphy.gif?cid=6c09b952tmewuarqtlyfot8t8i0kh6ov6vrypnwdrihlsshb&rid=giphy.gif&ct=s"> Contributors <a id = "Contributors"></a>

<table>
  <tr>
    <td align="center">
    <a href="https://github.com/nouralmulhem" target="_black">
    <img src="https://avatars.githubusercontent.com/u/76218033?v=4" width="150px;" alt="Nour Ziad"/>
    <br />
    <sub><b>Nour Ziad</b></sub></a>
    </td>
    <td align="center">
    <a href="https://github.com/yasmineghanem" target="_black">
    <img src="https://avatars.githubusercontent.com/u/74925701?v=4" width="150px;" alt="Yasmine Ghanem"/>
    <br />
    <sub><b>Yasmine Ghanem</b></sub></a>
    </td>
        </td>
    <td align="center">
    <a href="https://github.com/AhmedHosny2024" target="_black">
    <img src="https://avatars.githubusercontent.com/u/76389601?v=4" width="150px;" alt="Ahmed Hosny"/>
    <br />
    <sub><b>Ahmed Hosny</b></sub></a>
    </td>
        </td>
    <td align="center">
    <a href="https://github.com/BasmaElhoseny01" target="_black">
    <img src="https://avatars.githubusercontent.com/u/72309546?v=4" width="150px;" alt="Basma Elhoseny"/>
    <br />
    <sub><b>Basma Elhoseny</b></sub></a>
    </td>
  </tr>
 </table>


## <img  align= center width=50px height=50px src="https://moein.video/wp-content/uploads/2022/05/license-GIF-Certificate-Royalty-Free-Animated-Icon-350px-after-effects-project.gif"> License <a id = "License"></a>
This software is licensed under MIT License, See [License](https://github.com/BasmaElhoseny01/Pipeline-Processor/blob/main/LICENSE.md) for more information ©Basma Elhoseny.
