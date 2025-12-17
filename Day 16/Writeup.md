# Day 16 – Forensics - Registry Furensics

## 🎯 Objectives

* Learn how the Windows Registry is structured
* Learn how to find malicious behaviour in windows using the registry.

---

## 🖥️ Environment

* **Platform:** TryHackMe
* **Tools used:** Windows, Registry

---

## 🔍 Approach

First, we learned that the Windows Registry stores configuration values critical to system operation and user activity.

We then proceeded to run the VM and use a program called "Registry Explorer" which allowed us to review the registry of a compromised system.

The first part we started to inspect was the `Software` module. From this we can see that on the 21st of October the program `Drone Manager` was installed. This was found in the path `HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall`. As this isn't a familiar Windows application it stands out as suspicious.

To find the file location we swapped hive to `NT_USER.dat`. We then followed the path `ROOT\Software\Microsoft\Windows NT\CurrentVersion\AppCompFlags\Compatibility Assistant\Store`. This reveals a list of full paths for programs the user ran.

We then moved back to the `Software` hive and followed the path `HKLM\Software\Microsoft\Windows\CurrentVersion\Run` which revealed the path (`"C:\Program Files\DroneManager\dronehelper.exe" --background`) that was added so Drone Manager ran on startup.

---
## ⚠️ Challenges

* Understanding where to find specific registry entries.

---

## 🚩 Flags

No flags today!

---

## 📚 Lessons Learned

I learned today how the Windows registry is structured and where I can find specific information. Today's challenge also provided further insight on how to use the Windows registry in a Cyber Security role.

---

## 💭 Further Thoughts

Even after having worked with the registry in Windows before in my servicedesk role it was nice to learn about the functions and locations within the registry and how they assist windows in running.
