#include <ros.h>
#include <std_msgs/String.h>

ros::NodeHandle nh;
std_msgs::String voice_command;

char command_capture[];

void setup() {
  nh.initNode()
}
