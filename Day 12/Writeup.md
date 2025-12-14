# Day 12 – Phishing - Phishmas Greetings

## 🎯 Objectives

- Learn what the goals of different phishing e-mails are.
- Learn different ways to detect phishing e-mails

---

## 🖥️ Environment

- **Platform:** TryHackMe  
- **Tools used:** Firefox
---

## 🔍 Approach

For this task we had to identify 6 e-mails and explain why they were considered malicious. Please find my explanation below.

- **email 1**: Even though the e-mail and sender look legit the SPF and DMARC failed and the external links don't go to the actual Paypal domain.
- **email 2**: The SPF and DMARC have failed again here. The main giveaway is that the call recording is a `.html` file rather than the expected `.wav`. In this case we could run the file through virustotal to check what the malicious intents are.
- **email 3**: The giveaway on this e-mail is that it comes from an external domain, advises "not to contact" the real McSkiddy and pushes for a sense of urgency.
- **email 4**: This was the most convincing one as the links are legitimate as well as the SPF/DMARC passing. Some of the links were looking malicious.
- **email 5**: This wasn't phishing but just a spam e-mail.
- **email 6**: Type puning was used here to amend one of the letters in the domain name as it used the cyrlic alphabet, Also the links were malicious.

---

## ⚠️ Challenges

- Identifying why e-mails are phishing e-mails.

---

## 🚩 Flags

- THM{yougotnumber1-keep-it-going}
- THM{nmumber2-was-not-tha-thard!}
- THM{Impersonation-is-areal-thing-keepIt}
- THM{Get-back-SOC-mas!!}
- THM{It-was-just-a-sp4m!!}
- THM{number6-is-the-last-one!-DX!}

---

## 📚 Lessons Learned

Learned more in-depth of different phishing formats as well as how DMARC, SPF and DKIM are being used to avoid e-mail spoofing.

---

## 💭 Further Thoughts

Weirdly enough I do like doing the phishing e-mail rooms. Most of the ways shown I did already know but the explanation of DMARC/SPF/DKIM added some extra tools to my toolbelt.
