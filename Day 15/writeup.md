# Day 15 – Web Attack Forensics - Drone Alone

## 🎯 Objectives

* Learn further how Splunk works and how to query for information.
* Learn how to check whether a web server has been exploited.

---

## 🖥️ Environment

* **Platform:** TryHackMe
* **Tools used:** Splunk, Apache

---

## 🔍 Approach

As the goal was to search for suspicious web commands, we started by launching Splunk, setting the time range to **"All time"**, and entering the following query:

```
index=windows_apache_access (cmd.exe OR powershell OR "powershell.exe" OR "Invoke-Expression")
| table _time host clientip uri_path uri_query status
```

This did the following two things:

* Checked the web access logs for events that included `cmd.exe`, `powershell`, or `Invoke-Expression`.
* Presented the results in a table with the following attributes: `_time`, `host`, `clientip`, `uri_path`, `uri_query`, and `status`.

The reason for this query was to determine whether any suspicious commands were invoked, as `cmd.exe` and PowerShell would typically be used by an attacker on a Windows system rather than during normal web server operation.

This revealed that a Base64-encoded PowerShell command had been executed. When we decoded the command from Base64 to UTF-8, it revealed the string:

```
thisisnowminemuahaahaa
```

Next, we checked the web server error logs using the following Splunk query:

```
index=windows_apache_error ("cmd.exe" OR "powershell" OR "Internal Server Error")
```

This returned three results. Reviewing these showed that the web server attempted to execute the `hello.bat` batch file but failed, resulting in an internal server error.

The next step was to check the system logs of the web server via Splunk. This was done using the following query:

```
index=windows_sysmon ParentImage="*httpd.exe"
```

This provided several results showing the `hello.bat` file again, as well as `cmd.exe` being executed. This is a strong indicator of compromise, as `cmd.exe` spawning from the Apache web server (`httpd.exe`) is not expected behavior on a normal web server.

After this, we searched for `whoami` commands using the following query:

```
index=windows_sysmon *cmd.exe* *whoami*
```

This is a command commonly run by attackers after gaining access to a system in order to determine their current user context and permission level. We found four matching events.

The final Splunk search run for this room was:

```
index=windows_sysmon Image="*powershell.exe" (CommandLine="*enc*" OR CommandLine="*-EncodedCommand*" OR CommandLine="*Base64*")
```

This searched the Sysmon logs for any PowerShell executions containing encoded or obfuscated commands. This query returned no results, which indicates that while an encoded payload appeared in the web access logs, it was never successfully executed on the web server.

---

## ⚠️ Challenges

* Understanding how to correctly filter and pivot through Splunk logs.
* Learning the step-by-step process of determining whether a web server has been exploited.

---

## 🚩 Flags

No flags today!

---

## 📚 Lessons Learned

This was my first real exposure to analyzing a web server for signs of exploitation. I learned what types of commands and behaviors to look for, and how to correlate different log sources in Splunk to build a clearer picture of attacker activity.

---

## 💭 Further Thoughts

It was great working with Splunk again, as this is going to be one of my main tools in the future. The search queries were easier to understand this time, and I felt more confident interpreting what they were doing and why they mattered. While I am still building my understanding of web server internals, this room helped clarify the investigative process and should make future analysis tasks easier.
