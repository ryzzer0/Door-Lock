# Door Locking Mechanism with HCS12 Microcontroller

## Description
This code represents the locking mechanism of a door controlled by an HCS12 microcontroller. The lock is simulated with a motor connected to the HCS12 board. The password for opening and engaging the lock can be entered using a keypad connected to the board. The project also provides an option to reset the password and a lockout feature if an incorrect password is entered three times.

## Features
* Password-controlled locking mechanism
* Option to reset the password
* Lockout feature after three incorrect password attempts
* Display of password status on 7-segment LED display

## How it works
The code uses Pulse-Width Modulation (PWM) to govern a motor that controls the opening and closing of the lock. It continuously reads input from the keypad and verifies it against the correct code using the check_code() function. When the code is accepted, the motor rotates clockwise to unlock the lock. If the code is not accepted, the motor moves counterclockwise.

The program initializes the PWM channel 4 by setting various registers, controlling the polarity, clock source, prescaler, scaler, period, and duty cycle of the PWM output. The program uses an infinite loop to continuously read input from the keypad and uses IF statements to determine whether a correct code has been entered.

The code includes a segment_decoder array that maps integer values to 7-segment LED display patterns for hexadecimal digits and some letters. There are functions to display a hexadecimal number and a passcode on the 7-segment LED display, using the segment_decoder array, PORTB, and DDRP registers.

## Project code
The project code can be found in the main.c file.

## Usage
* Compile the code and upload it to the HCS12 microcontroller.
* Connect the motor to the HCS12 board.
* Connect the keypad to the HCS12 board.
* Power on the HCS12 board.
* Enter the password using the keypad.
* If the password is correct, the motor will rotate clockwise to unlock the lock.
* If the password is incorrect, the motor will move counterclockwise, and the lock will remain engaged.
