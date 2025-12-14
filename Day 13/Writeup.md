# Day 13 – YARA Rules - YARA mean one!

## 🎯 Objectives

- Learn what Yara is and how it's being used
- Learn how to create a Yara rule.

---

## 🖥️ Environment

- **Platform:** TryHackMe  
- **Tools used:** Terminal, Yara
---

## 🔍 Approach

For this task we were pointed at the `/home/ubuntu/Downloads/easter/` folder on the machine. In this folder there were 60 `.jpg` files for which we needed to create a Yara rule to extract the information.

First we created the full Yara rule as per the intructions which can be found [here](https://github.com/Andur1n/Advent-of-Cyber---2025/blob/main/Day%2013/TBFC_message_trace%20.yar).

Once done we ran the Yara rule in terminal with the command `yara -rs /home/ubuntu/Downloads/easter/TBFC_message_trace /home/ubuntu/Downloads/easter`.

This revealed the .jpg folders with the required information and the secret message left by McSkiddy.

---

## ⚠️ Challenges

- Learning what Yara rules are and how they are used.
- Applying regular expression rules to get the required information.

---

## 🚩 Flags

No flags today!

---

## 📚 Lessons Learned

I learned what Yara rules are and how they're used within a security enviroment. I also learned how a Yara rule is made up and different attributes that can be applied.

---

## 💭 Further Thoughts

This was a fun hands-on room and a great introduction to Yara. I enjoyed the puzzling and searching howto get the Yara rule to work.
