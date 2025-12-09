# Day 9 – Passwords - A Cracking Christmas

## 🎯 Objectives

- Learn about how attackers approach password cracking.
- Get introduced to a few new cracking tools
- Learn how defenders detect password cracking.

---

## 🖥️ Environment

- **Platform:** TryHackMe  
- **Tools used:** Linux Terminal, PDFCrack and John the Ripper
---

## 🔍 Approach

Our first objective was to crack the pdf on the desktop. We would use pdfcrack with this together with the command `pdfcrack -f flag.pdf -w /usr/share/wordlists/rockyou.txt`. This revealed the password for the pdf file and allowed us to get the first flag.

For the second part we need to crack a .zip file with John the Ripper. First we need to create a password hash for John to crack. We use the command `zip2john flag.zip > password.txt` to create a .txt file with the hash. After this we run John the Ripper using the rockyou.txt wordlist with the following command: `john --wordlist=/usr/share/wordlists/rockyou.txt password.txt`. This revealed the password and we were then able to unzip the file and receive the second flag.

---

## ⚠️ Challenges

- Remembering what commands to use to use the tools

---

## 🚩 Flags

THM{Cr4ck1ng_PDFs_1s_34$y}
THM{Cr4ck1n6_z1p$_1s_34$yyyy}

---

## 📚 Lessons Learned

- Got introducted to pdfcrack and how to use this.
- Learned how to crack the password on a .zip file using zip2john.

---

## 💭 Further Thoughts

I liked this room mainly as I've been working with John quite a bit lately and have used it as well last weekend for the Blue room so it was all pretty fresh in my mind. Short but sweet room.
