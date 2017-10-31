The project is a simple conversational agent between an arduino controller and ROS publisher. A serial connection is established
utilizing ROSSerial_python an additional module that makes interpretation between the two possible. It takes advantage of the google
speech recognition libraries and implements its speech to text to draw comparisions between what was thought to be said by the
speaker and a number of built in commands. The project currently only accepts 1 command, inteprets it for a duration, and sends/executes
said command to the servo motor. Similar to a previous project the servo is asked to switch its current angle.

Current voice commands include:
0
30
60
90
120
150