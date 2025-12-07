# Day 6 – Malware Analysis: Egg-xecutable 🥚💻

## 🎯 Objective

- Learn the principles of malware analysis  
- Understand how sandboxes are used for malware analysis  
- Explore static vs dynamic analysis  
- Get introduced to: **PeStudio, ProcMon, Regshot**

---

## 🖥️ Environment

- **Platform:** TryHackMe  
- **Tools used:** PeStudio, ProcMon, Regshot  

---

## 🔍 Approach

After reading the introduction, we started with **static malware analysis**, which involves inspecting the file without running the executable. For this, we used **PeStudio**, which displayed important details such as the **SHA256 hash**, indicators of compromise, and interesting **strings** found within the `.exe` file.

Once the static analysis was completed, we took an initial **snapshot of the system registry** using **Regshot**.

We then **executed the malicious file** in a controlled environment. After execution, we ran **Regshot a second time** to compare both snapshots. This allowed us to identify **changes made to the registry**, giving insight into what system modifications the malware attempted to perform.

Finally, we used **Process Monitor (ProcMon)** and ran the malicious `.exe` file again. ProcMon allowed us to view the program’s behaviour in **real-time**, including:
- File system activity  
- Registry access  
- **TCP connections to external hosts**, which may indicate command-and-control or data exfiltration behaviour  

This step provided a much clearer view of what the malware was attempting to do behind the scenes.

---

## ⚠️ Challenges

- Learning how to effectively use **PeStudio, ProcMon, and Regshot**  
- Understanding and analyzing the impact of malware on a system  
- Interpreting the large amount of data produced by ProcMon  

---

## 🚩 Flags

No flags for Day 6.

---

## 📚 Lessons Learned

This was my first real introduction to malware analysis, and it was both informative and engaging. I learned the importance of:

- **Never running unknown executables on a live system**
- Using a **sandboxed environment** for analysis
- The value of both **static and dynamic analysis**
- How registry and process monitoring can expose hidden system changes

These tools and techniques will be very valuable for any future security investigations.

---

## 💭 Further Thoughts

I really enjoyed this room. It introduced a brand new topic for me that I hadn’t explored before. The hands-on experience with professional tools made the learning process much more engaging. Overall, it was a great and very practical introduction to malware analysis.
