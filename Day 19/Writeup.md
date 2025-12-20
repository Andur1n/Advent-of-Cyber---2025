# Day 19 – ICS/Modbus - Claus for Concern

## 🎯 Objectives

- How SCADA (Supervisory Control and Data Acquisition) systems monitor industrial processes
- What PLCs (Programmable Logic Controllers) do in automation
- How the Modbus protocol enables communication between industrial devices
- How to identify compromised system configurations in industrial systems
- Techniques for safely remediating compromised control systems
- Understanding protection mechanisms and trap logic in ICS environments
  
---

## 🖥️ Environment

- **Platform:** TryHackMe  
- **Tools used:** Python, Terminal
---

## 🔍 Approach

We first learned about modbus and how this is used within factories etc. to control processes of different microcontrollers/sensors and how they're vulnerable.

We then learned further about the modbus protocol and how it interacts with microcontrollers.

The task for today was to restore a compromised factory.

We first ran a [recconnaissance](https://github.com/Andur1n/Advent-of-Cyber---2025/blob/main/Day%2019/reconnaissance.py) python script first which connected to the modbus controller and checked the values of the sensors.

Once this was done we ran a [remediation](https://github.com/Andur1n/Advent-of-Cyber---2025/blob/main/Day%2019/remediation.py) script to set the sensor values correctly again and restore operations.

This then revealed the flag of the task.

---

## ⚠️ Challenges

- Seeing how modbus interacts with microcontrollers via python scripts.

---

## 🚩 Flags

- THM{eGgMas0V3r}
---

## 📚 Lessons Learned

Learned further how the modbus protocol controls microcontrollers and how you can adjust the settings via python scripts.

---

## 💭 Further Thoughts

Funnily enough this hooked in very well with my Python advent calendar which is all about making tiny Python projects with a Microcontroller. It was cool seeing the 2 projects merge together and how this works from a Cyber Security point of view.
