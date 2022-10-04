---
toc: true
comments: false
layout: post
title: Big Idea 2 'Binary Numbers'
description: taking a look at binary abstractions and logic gates
permalink: /collegeboard/binary
image: /images/apcsp.png
categories: [1.D, 2.B, 3.C]
type: ap
week: 8
---

# Binary Abstraction and Logic Gates
> Concepts and Visualization Ideas

## Multiply and Divide by 2 (Shift)
Shifting bits is a common computer operation
Look for shift on [w3schools](https://www.w3schools.com/js/js_bitwise.asp)

### UI Concept/Design
![]({{site.baseurl}}/images/binary_shift.png)
*n Right Shifts (divides by 2^n); n Left Shifts (mutliplies by 2^n)*
Add buttons for  "<<"   and  " >>"

### Logic of Shift
![]({{site.baseurl}}/images/logic_of_shift.png)

### Elaboration of Shift
![]({{site.baseurl}}/images/elaboration_of_shift.png)
*Arithmetic Shift*

In an arithmetic shift, the bits that are shifted out of either end are discarded. In a left arithmetic shift, zeros are shifted in on the right; in a right arithmetic shift, the sign bit (the MSB in two's complement) is shifted in on the left, thus preserving the sign of the operand.
This example uses an 8-bit register, interpreted as two's complement:
In the first case, the leftmost digit was shifted past the end of the register, and a new 0 was shifted into the rightmost position. In the second case, the rightmost 1 was shifted out (perhaps into the carry flag), and a new 1 was copied into the leftmost position, preserving the sign of the number.

##  Unicode vs ASCII

### Unicode can be UTF-8, 16 or 32, ASCII is preserved in Unicode.
![]({{site.baseurl}}/images/sample_unicode.png)
*Sample of Unicode characters.*

### UI Concept/Design
![]({{site.baseurl}}/images/ascii_label.png)
*Original ASCII*

The ASCII label in picture should be change based off of the type of evaluation you are doing.  Bits displayed, label, and evaluation would be specific to evaluation type:
- ASCII - 7 bits
- UTF-8
- UTF-16
- UTF-32

## Color Codes

### Color code is a 24 bit abstraction.
![]({{site.baseurl}}/images/color_code.png)
*255 * 255 * 255 combinations of R, G, B*

### UI Design
![]({{site.baseurl}}/images/color_block.png)
*by Anthony Vo*
3 rows representing R, G, B 
Resulting color displayed in block

## Logic Gates

### Logic Gates can be simulated with 2 bits
Look for bitwise operators on [w3schools](https://www.w3schools.com/js/js_bitwise.asp)

### UI Concept
![]({{site.baseurl}}/images/logic_gates.png)
*Logic Gates*
Establish check boxes for A / B on and off
Show result of Boolean Expression using Gate visual

### UI Design
![]({{site.baseurl}}/images/logic_gate_lab.png)
*by Kylie Scharf*
AB checkboxes with Submit button
Table with Symbol, Description, and Result

### Logic of Logic Gates
A logic gate can have two inputs (a,b) and by how changing these inputs it impacts the output(c). 

There are four possible inputs:
- 0 0
- 0 1
- 1 0
- 1 1

Understanding the output enables us to understand a logical expressions.  All outputs are routed in Logic Gates (similar to how a language is routed in Latin). 
- AND is true for 1 1; NAND is true opposite of AND 0 0, 0 1, 1 0
- OR is true for 1 1, 0 1, 1 0, NOR is true opposite of OR 0 0
- XOR is true for 0 1, 1 0

### Practical Application
![]({{site.baseurl}}/images/logic_gate_application.png)

## Unsigned Addition
Here we are requesting 3 rows of bits to simulate Math. This could be done with 4, 8, or 16 bits.

### Initial UI Implementation
![]({{site.baseurl}}/images/binary_math_conversion.png)
Action buttons for +1 and -1
Additional actions for Turn On and Turn Off

### Unsigned Addition
![]({{site.baseurl}}/images/unsigned_addition.png)

## Signed Addition
Integers in most languages are int8, int16, int32, or int64. They typically reserve left most bit for sign.

### Common concept for Integer Math
![]({{site.baseurl}}/images/integer_math_pos.png)
*Positive number*

### Basic concept, but not typically used
![]({{site.baseurl}}/images/integer_math_neg.png)
*Negative number*

### Inverting numbers, twos complement
![]({{site.baseurl}}/images/twos_complement.png)
*Two's complement allows adding for signed and unsigned numbers*

Basic concept is to invert/negate bits to produce negative. This allows numbers to be added together for expected results. >> and >>> have been adapted to handle signed and zero filled shifting.

## Technical helpers

### Algorithm in Jinja2 to limit Bits per row
![]({{site.baseurl}}/images/binary_math_conversion_example.png)
*8 images per row by Kylie Scharf*
Modulo 8 algorithm add <tr> for every eight bits (code).

### Binary Addition overview
[CHAPTER 8 - Binary Addition and Two's Complement](https://chortle.ccsu.edu/AssemblyTutorial/Chapter-08/ass08_1.html)
*Overview find by Val Wilson*

# Hacks
 



