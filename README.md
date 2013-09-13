powerbasic-to-cpp
=================

Converts PowerBASIC source code to C++.  For use with uCalc Transform.

If you write programs using PowerBASIC and would like to make your software available on other platforms such as Mac OS, Android, Linux at large, or other platforms, or if you want to have a 64-bit version of your DLL for Windows, then one solution is to convert your code to C++, which can then be re-compiled on other platforms.  You can still continue developing in PB, and then perform the auto-conversion of your code to C++ when you are ready to recompile for another platform.

### Using uCalc Transform
![uCalc Transform](http://www.ucalc.com/images/pbtocpp.png "uCalc Transform Example")

Automatically translating source code from one language to another is among the things uCalc Transform (downloadable from http://www.ucalc.com/transform.html ) is designed for.  This Open Source project is about constructing the transform file(s) that will tell uCalc Transform how to take PowerBASIC source code as input, and automatically generate equivalent C++ output.

The process is very simple.  A transform file consists of a list of Find/Replace criteria pairs, one of which may look like this:

The Find part (representing PB):
`If {cond} Then {statement%}{nl}`

The Replace part (representing C++):
`if ({cond}) { {statement} }{nl}`

### How to help

Your help is needed in creating Search/Replace patterns covering as many PB statements and constructs as possible.  PB is close enough to Visual Basic in a number of ways, so VB users can also help.  Even C++ users who don't program in any flavor of BASIC can help with C++ parts.

Here are various ways you can contribute (choose any combination of these):

- Test existing patterns, and point out situations where it doesn't work (or confirm that it works in all cases you've tried it).

- Post test cases that other contributors can test their patterns against to make sure their patterns work as intended.  Please post a short snippet of sample PB code in one file with a .bas extension, and also, if possible, a similarly named file, but with a .cpp extension representing what the output should look like.

- Post Find/Replace patterns.  The following are suggested guidelines.  Feel free to suggest other guidelines that could make the process even easier.
   - Use the current version of uCalc Language builder to construct your Find/Replace patterns.
   - Test it.
   - Click where it says: "[Add a description]" in uCalc Transform (on the bottom right of the save button), and identify yourself as the author of that section, along with a summary of what you're contributing.  Note: Each individual Find/Replace criteria also includes a Comment property.  You may also enter text in a Find box, and remove the checkmark (so it is ignored) to have it serve as a comment for items below.
   - Save it and upload it along with the test code you used.

- Make suggestions, ask questions, cheer the project on, invite others to join, etc.
   
