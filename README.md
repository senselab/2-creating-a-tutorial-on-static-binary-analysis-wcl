# A Tutorial on Static Binary Analysis Tools


Given an unknown malware sample, it will first go through a classification process to determine if it is related to a known malware family. If the classification does not return any useful information, then a manual inspection will be needed.

For classification, one famous tool is the <cite>[YARA][1]</cite> identification and classification engine. Using YARA, you can create rules that detect strings, instruction sequences, regular expressions, byte patterns, etc. You can then scan files unsing the command-line yara utility or integrate the scanning engine into your own C or python tools with YARA's API. 

The manual inspection is more complicated. In the end, it may require binary reverse engineering on the sample, which usually involves the use of disassembly tools such as IDA Pro and various analysis toolkits such as <cite>[BinDiff][3]</cite>. For disassembly, one famous open source tool is <cite>[Ghidra][2]</cite> from National Security Agency. It also works with BinDiff via the <cite>[Ghidra BinExport extension][4]</cite>. 


In this project, please prepare a tutorial on the installation and usage of YARA, Ghidra, and BinDiff.

In the tutorial, you should give examples showing

* Creation of YARA rules to look for files containing specific strings (e.g., *.facebook.com)
* Disassembly and decompilation of binary executables
* Use of BinDiff to tell if two binaries contain similar code pieces (for instance, you can use BinDiff to compare a binary executable with a known library to see if the unknown executable uses a specific library)

[1]:https://virustotal.github.io/yara/
[2]:https://ghidra-sre.org/
[3]:https://zynamics.com/software.html
[4]:https://github.com/google/binexport/tree/master/java/BinExport



## Task 1: Creation of YARA rules to look for files containing specific strings

### Environment

- Windows 10 x64 1909

### Goal

1. Find URL in executable file.
2. Find "expired" string in executable file.

### Step

1. Download yara binary from GitHub Release Page: https://github.com/VirusTotal/yara/releases and unzip it.

2. Change working directory to ```bin```

3. Execute ```yara64.exe -s ..\01_find_url.yar ..\target``` to show urls in executable files in target folder.

   ![](https://i.imgur.com/nvnho4A.png)

4. Execute ```yara64.exe -s ..\02_find_expire.yar ..\target``` to show which string contains "expired" in executable files in target folder.

   ![](https://i.imgur.com/v9FfWQ3.png)

   As you can see, strings are store in UTF-16LE format. Just replace \x00 in string make it readable.

   For first matched string, it is "OnCreate PrivateExpiryDateCheck spacedesk VIEWER BETA has expired".

### Reference

1. https://yara.readthedocs.io/en/v3.11.0/writingrules.html
2. 