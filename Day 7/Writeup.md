# Day 7 – Network Discovery - Scan-ta Clause

## 🎯 Objectives

- Learn the basics of network service discovery with Nmap
- Learn core network protocols and concepts along the way

---

## 🖥️ Environment

- **Platform:** TryHackMe  
- **Tools used:** Nmap, Netcat, MySQL

---

## 🔍 Approach

We first Nmap scanned the web server target with the command **nmap 10.48.151.165** through which we discovered the SSH port was open. We then opened an SSH session with **ssh 10.48.151.165** and logged in as the user anonymous. We found the first key file and downloaded it to our PC.

For the second key we used netcat **NC 10.48.151.165 25251** on the server. Once connected we could enter command **GET KEY** to get the 2nd key.

And for the last key we ran nmap again but now on udp ports with command **nmap -sU 10.48.151.165**. We found that UDP port 53 was open. We then ran **dig @10.48.151.165 TXT key3.tbfc.local +short** which revealed the 3rd key

The 3 keys were then combined into one key which was entered in the web portal. This gave us access to the server and the database.

We then ran  **mysql -D tbfcqa01 -e "show tables;** followed by **mysql -D tbfcqa01 -e "select * from flags;** to get the final flag from the database on the server.

---

## ⚠️ Challenges

- Getting familiar with Nmap and Netcat
- Understanding how to find open network ports.

---

## 🚩 Flags

Key 1: 3aster_
Key 2: 15_th3_
Key 3: n3w_xm45
Final Flag: THM{4ll_s3rvice5_d1sc0vered}

---

## 📚 Lessons Learned

- Got introduced to Netcat
- Learned some new parameters that go with Nmap

---

## 💭 Further Thoughts

This was a very comfy room as I've been doing alot with Nmap lately to get to know the program alot better. It was nice to discover netcat as well and would like to do some more digging on what it's capabilities are.
