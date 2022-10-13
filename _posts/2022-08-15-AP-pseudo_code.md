---
toc: true
comments: true
layout: post
title: College Board Pseudo Code
description: The College Board testing language is Pseudo Code.  Pseudo mean kind-of, or in this case College Board uses a kind-of programming language in its Multiple Choice exam.
image: /images/pseudo_code.png
permalink: /collegeboard/pseudo_code
categories: [2.A, C4.0, C4.6]
tags: [pseudoCode]
type: ap
week: 0

---
## Learning College Board Pseudo Code
Thousands of different programming languages have been created, and more are being created every year.  College Board has designed a pseudo code, non operational programming language, to highlight concepts that it wants every student to learn.  College Board pseudo code highlights instructions that are common for many languages.  

BTW, instructions are translated into machine code for computers to execute.  The notation we look at is supposed to be easy for the user and their application.  For instance, many new languages are being popularized around data science.  It is more important that a Data Scientist is successful in their task, than to learn syntax that is not familiar to their traditional workspace.

College Board is trying to remain neutral and build Computer Science Principles off of any language, thus the Teacher is left to pick the language(s) according to application and curriculum. 

[Exam Reference Sheet](https://apcentral.collegeboard.org/media/pdf/ap-computer-science-principles-exam-reference-sheet.pdf)

### Comparison of CB Pseudo Code to Python with descriptions

Command Vocabulary | Pseudo code         | Python                 | Purpose
Output       | DISPLAY(expression) | print(expression, end=" ") | Displays the value of expression, followed by a space. Python defaults to newline, thus the end=" "
Input        | a ← INPUT()         | a = input(prompt)      | Accepts a value from the user and returns it to the variable a.
Assignment   |	a ← expression	   | a = expression         | Evaluates expression and assigns the result to the variable a.
Selection    | IF (expression)     | if expression:         | Run commands in the code block associated with the selection
Iteration n times     |	REPEAT n TIMES      | for i in range(n): | Repeat commands in the code block associated withe the iteration n times
Iteration expression  | REPEAT UNTIL (expression) |	while expression: |  Repeat commands in the code block associated withe the iteration while expression is true
List Assignment | list ← [expression1, expression2, expression3] | list = [expression1, expression2, expression3] | Assigns 3 values to list, value can be literal or expressions
First index in List     |	list[1] | list[0] | Access the 1st element in the list[].  FYI, most programming languages start a zero.
Last index in List    | list[LENGTH(list)] | list[len(list) - 1] | Access the last element in the list[].  If you start at zero, last element is length - 1.
Define Procedure      | PROCEDURE name (parameter) | def name(parameter): |  Create a procedure containing a sequence of programming instructions.
Expression equals     |	a = b	| a == b  | Evaluate if assigned value of a equals assigned value of b
Expression not equals |	a ≠ b	| a != b  | Evaluate if assigned value of a is NOT equal to assigned value of b


### Pseudo IF Code Block using curly braces
```
a ← 1
b ← 1

IF (a = b) {
   DISPLAY("A equals B")
}
```

### Python IF Code Block using indent
```python
a = 1
b = 1
if (a == b):
    # Python uses indent to establish code block, Teacher use tab key
    print("A equals B")
```

### Suggestions for students
It is very important that you become fluent in "Command Vocabulary" and "Purpose" of the Pseudo Code versus Python comparison.  During the year you will look at JavaScript which has same Command Vocabulary and Purpose.  Others may take Java, you will see the same ideas again.  
- Start building Vocabulary and Purpose by Code/Code/Coding
- Supplement you Code with comments and outputs using Markdown and Jupyter notebooks.  This style allows you to code explore and learn as you go.
- Use CB pseudo code as part of your definitions as you build your notebooks.

## Hacks
- Build your own Notebook to highlight what you want to capture on pseudo code
- Add a link in your Notebook to College Board pseudo code reference and other materials you find interesting by searching the internet