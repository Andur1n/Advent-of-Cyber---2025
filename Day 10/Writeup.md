# Day 10 – SOC Alert Triaging - Tinsel Triage

## 🎯 Objectives

- Understand the importance of alert triage and prioritisation
- Explore Microsoft Sentinel to review and analyse alerts
- Correlate logs to identify real activities and determine alert verdicts
  
---

## 🖥️ Environment

- **Platform:** TryHackMe  
- **Tools used:** Microsoft Sentinel
---

## 🔍 Approach

Our goal today is to get our first hands-on experience with Microsoft Sentinel (SIEM) and to learn how alerts are analyzed.

We started by logging into `Azure` and then navigated to `Microsoft Sentinel`. In there we found our cluster and logs available.

From there we found three alerts that would be considered a bit worrying.

- **Root SSH Login**  from External IP - Someones acquired root access to the machine via SSH.
- **SUID Discovery** - The attacker has been searching for SUID values (marked as an s when running `ls -la`) to elevate their permissions.
- **Kernel Module Insertion** - The attacker inserted a malicious kernel module.

For the last bit of the task we needed to do a little bit more log analysis and find out the details on what kernel module has been inserted.

We've ran the below search query within `Microsoft Sentinel Logs` which returned us with the information that the user account `alice` was added to the `sudo` group to elevate permissions. It then changed the password for `backupuser` and and inserted `malicious_mod.ko` with their sudo permissions.

```
set query_now = datetime(2025-10-30T05:09:25.9886229Z);
Syslog_CL
| where host_s == 'app-02'
| project _timestamp_t, host_s, Message
```

---

## ⚠️ Challenges

- Understanding how alerts get triaged and what patterns to look for.

---

## 🚩 Flags

- No flags today!

---

## 📚 Lessons Learned

Today we learned the logic of how alerts get triaged and how this is done within Microsoft Sentinel.

---

## 💭 Further Thoughts

I really liked the subject of the room. Sadly it just felt a bit messy due to being a shared account as there was loads of data from previous users there.
