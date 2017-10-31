#!/usr/bin/env python
import speech_recognition as sr
import rospy
from std_msgs.msg import String

def start_voice():
    #Prepare to publish to the arduino serial connection
    pub = rospy.Publisher('arduino', String, queue_size=20) #target to publish to
    rospy.init_node('voice_module', anonymous=True) #init and name of node
    rate = rospy.Rate(1)

    #prepare the voice recognizer
    r = sr.Recognizer()
    with sr.Microphone() as source:
        print('Says something')
        audio = r.listen(source)

    #listen for voice and if found post to serial
    print("Interpreting..")
    try:
        command = r.recognize_google(audio)
        pub.publish(command)
        print(command)
    except sr.UnknownValueError:
        print('failure')
    except sr.RequestError as e:
        print('Cannot accept request')
    #rospy.spin()

if __name__ == '__main__':
    start_voice()
