powerbasic-to-cpp
=================

Converts PowerBASIC source code to C++.  For use with uCalc Transform.

If you write programs using PowerBASIC and would like to make your software available on other platforms such as Linux and Mac OS, or if you want to have a 64-bit version of your DLL for Windows, then one solution is to convert your code to C++, which can then be re-compiled on other platforms.  You can still continue developing in PB, and then perform the auto-conversion of your code to C++ when you are ready to recompile for another platform.

### Using uCalc Transform

Automatically translating source code from one language to another is among the things uCalc Transform (downloadable from http://www.ucalc.com/transform.html ) is designed for.  This Open Source project is about constructing the pb-to-cpp.uc transform file (and possibly other accompanying files) that will tell uCalc Transform how to take a PowerBASIC source code file as input, and automatically generate an equivalent C++ output file.

The process is very simple.  A transform file consists of a list of Find/Replace criteria pairs.  A pair might look like this:

The Find part (representing PB):
`If {cond} Then {statement%}{nl}`

The Replace part (representing C++):
`if ({cond}) { {statement} }{nl}`

Note: These should be entered from within uCalc Transform instead of raw text as shown above.  uCalc Transform also includes configurable properties for each Find/Replace pair. 

### How to help

Your help is needed in creating Search/Replace pairs covering as many PB statements and constructs as possible.  PB is close enough to Visual Basic in a number of ways, so VB users can also help.

Here are various ways you can contribute:

- Test existing patterns, and point out situations where it doesn't work (or confirm that it works in all cases you've tried it it).

- Post test cases in the /test directory that other contributors can test their patterns against to make sure their patterns are good.  Please post a short snippet of sample PB code in one file with a .bas extension, and also a similarly named file, but with a .cpp extension representing what the output should look like.

- Post actual Find/Replace patterns in the /convert directory.  The following are suggested guidelines.  Feel free to suggest other guidelines that could make the process even easier.
   - Use the current version of uCalc Language builder to construct your Find/Replace patterns.
   - Test it.
   - Click where it says: "[Add a description]" in uCalc Transform (on the bottom right of the save button), and identfy yourself as the author of that section, along with a summary of what you're contributing.  Note: Each individual Find/Replace creteria also includes a Comment property.  You may also enter text in a Find box, and remove the checkmark (so it is ignored) to have it serve as a comment for items below.
   - Save it (and all of your future changes) in a file named after your GitHub profile name, and upload to the /convert directory.  Note: these will periodically be merged with pb-to-cpp.uc.
   - Upload the test code you tested it with, in the /test directory.

   
