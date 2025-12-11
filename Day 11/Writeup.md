# Day 11 – XSS - Merry XSSMas

## 🎯 Objectives

- Learn what XSS attacks are
- Learn about different types of XSS attacks
- Learn how XSS vulnerabilities are exploited.

---

## 🖥️ Environment

- **Platform:** TryHackMe  
- **Tools used:** Firefox
---

## 🔍 Approach

We first received an instruction where we were introduced to what stored and reflective XSS are.

We then opened the "Vulnerable to XSS" website in Firefox. We used the search function to show that the website was vulnerable to reflective XSS by entering `<script>alert('Reflected XSS')</script>`. This revealed the first flag.

Then we exploited the stored XSS vulnerability by using the "Send a message to McSkiddy" function. We inserted `<script>alert('Stored Meow Meow')</script>` which then revealed the second flag.

---

## ⚠️ Challenges

- Learn the differences between the XSS attacks and how they're exploited.

---

## 🚩 Flags

- THM{Evil_Bunny}
- THM{Evil_Stored_Egg}

---

## 📚 Lessons Learned

I learned today what XSS attacks are, 2 different type of XSS attacks as well on how either are exploited.

---

## 💭 Further Thoughts

I always love a new subject. As I've not done much with web exploitation it's a exciting topic.
