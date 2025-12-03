# Day 3 – Splunk Basics - Did you SIEM?

## Objective

- Ingest and interpret custom log data in Splunk
- Create and apply custom field extractions
- Use Search Processing Language (SPL) to filter and refine search results
- Conduct an investigation within Splunk to uncover key insights


## Environment

- Platform: TryHackMe
- Tools: Splunk


## Approach

At first, the challenge introduced how Splunk works and how we can search events based on different data fields and time periods.

Following this, we began looking for unusual traffic and identified requests made using curl, wget, and Havij, all of which were highly suspicious. Upon further investigation, we discovered that all of these requests originated from the same IP address (198.51.100.55).

With the attacker’s IP identified, we pivoted our investigation to trace their activity step-by-step and understand the full scope of the ransomware attack.


## Investigation Steps

### 1. Reconnaissance

We filtered the web traffic for requests targeting commonly exposed or misconfigured files such as:

- `/.env`
- `/phpinfo.php`
- `/.git/`

These requests are often used by attackers to discover sensitive environment variables, system configuration details, or version control information.

All of the attempts resulted in 401, 403, or 404 responses, indicating that the files were either protected or not present on the server.

Example paths:
- `/.env`
- `/phpinfo.php`
- `/.git/config`


### 2. Enumeration / Vulnerability Testing

A further search was conducted to identify potential path traversal attempts. This included malicious strings such as:

- `../../`
- `..%2f..%2f`
- `%2e%2e%2f`

These patterns indicate attempts to escape the web root directory and access system-level files such as `/etc/passwd`.

Example malicious paths:
- `/../../../../etc/passwd`
- `/..%2f..%2f..%2f/etc/shadow`

We also filtered for SQL injection tools and payloads by inspecting the user agent strings, which revealed automated tools such as SQLMap and Havij attempting time-based SQL injection attacks using functions like `SLEEP(5)`.

Some of these attempts resulted in 504 responses, suggesting a potential successful time-based injection test.


### 3. Exfiltration Attempts

We ran further queries to determine if the attacker was attempting to access or download large or sensitive files such as backups and logs.

Example paths:
- `/backup.zip`
- `/logs.tar.gz`

These requests indicate a likely attempt to exfiltrate large volumes of sensitive data from the compromised system.


### 4. Ransomware & Staging

Additional searches revealed that the attacker had uploaded and/or executed malicious files on the web server, including:

- `/bunnylock.bin`
- `/shell.php?cmd=`

The presence of `shell.php` indicates a successful web shell, granting the attacker the ability to execute commands remotely on the server. The execution of `bunnylock.bin` strongly suggests ransomware staging or execution.


### 5. Firewall Logs & Data Exfiltration

Finally, we pivoted to the firewall logs to confirm outbound connections from the compromised server (10.10.1.5) to the attacker’s IP address.

These logs confirmed communication with a Command & Control (C2) server, as well as a high volume of data being transferred outbound — indicating confirmed data exfiltration.


## Challenges

- Learning how to navigate and interpret Splunk data efficiently
- Understanding why certain requests are considered suspicious or malicious
- Developing a clear understanding of an attacker’s methodology and progression


## Flags

No flags for this challenge.


## Lessons Learned

- Gained first-hand experience using Splunk as a SIEM tool
- Learned how to identify and interpret suspicious web traffic
- Developed an understanding of the attacker’s mindset and methodology
- Improved awareness of common attack techniques such as:
  - Reconnaissance
  - Path traversal
  - SQL injection
  - Data exfiltration
  - Web shell usage
  - Ransomware staging


## Further Thoughts

I am extremely new to SIEMs, and this was a great first experience with Splunk. The challenge took longer to complete due to unfamiliarity with the tool, the attacker mindset, and common attack patterns. However, it provided an excellent introduction to SIEM analysis and real-world investigation techniques.
