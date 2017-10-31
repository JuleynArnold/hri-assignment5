#include <ros.h>
#include <std_msgs/String.h>
#include <std_msgs/Empty.h>
#include <Servo.h>

ros::NodeHandle  nh;
String command;
std_msgs::String nan;
Servo s;

void messageCb( const std_msgs::String& toggle_msg){
  command = String(toggle_msg.data);
  Serial.print(command);
    if (command == "0"){
    s.write(0);
  } 
  else if (command == "30"){
    s.write(30);
  } 
  else if (command == "60"){
    s.write(60);
  } 
  else if (command == "90"){
    s.write(90);
  } 
  else if (command == "120"){
    s.write(120);
  } 
  else if (command == "150") {
    s.write(150);
  } 
  else if (command != ""){

  }
  
}

ros::Subscriber<std_msgs::String> sub("arduino", messageCb);

void setup() {
  nh.initNode();
  nh.subscribe(sub);
  s.attach(8);
}

void loop() {
  nh.spinOnce();
  delay(1);
}

