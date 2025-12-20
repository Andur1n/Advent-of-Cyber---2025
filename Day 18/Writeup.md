# Day 18 – Obfuscation - The Egg Shell File

## 🎯 Objectives

- Learn about obfuscation, why and where it is used.
- Learn the difference between encoding, encryption, and obfuscation.
- Learn about obfuscation and the common techniques.
- Use CyberChef to recover plaintext safely.


---

## 🖥️ Environment

- **Platform:** TryHackMe  
- **Tools used:** CyberChef, Powershell
---

## 🔍 Approach

This challenge plays in a Windows environment and has a Powershell script with missing values. The goal is to encode/decode the values from the script with Cyberchef. We then enter them back into the Powershell script and run it to obtain the flags.

The first value was `aHR0cHM6Ly9jMiSub3J0aHBvbGUudGhtL2V4Zmls`. We decoded it from base64 and it gave us the link: `https://c2.northpole.thm/exfil`. We entered this into the script, ran it to get our first flag.

The second value we needed to encode the other way around. The way we encoded this was `CANDY-CANE-API-KEY` -> `XOR` (0x37 Key) -> `To Hex` (Delimiter: None) which then gave us: `747679736e1a747679721a76677e1a7c726e`. We entered this into the script and ran it again. This provided us with the second flag.

---

## ⚠️ Challenges

- Applying the correct recipes in CyberChef to get the correct output.
---

## 🚩 Flags

- TTHM{C2_De0bfuscation_29838}
- THM{API_Obfusc4tion_ftw_0283}

---

## 📚 Lessons Learned

I learned what obfuscation is and how it's used by malicious attackers to hide their code/intent. We also learned different way in how to uncover this using CyberChef.

---

## 💭 Further Thoughts

It was a nice follow up from yesterday's room as CyberChef was still fresh in mind. Feeling a bit more confident with CyberChef now and starting to see it's uses.
