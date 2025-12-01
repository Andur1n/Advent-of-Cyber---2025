
# Day 1 – Linux CLI - Shells Bells

## Objective

The objective of this task was to gain familiarity with the Linux command-line interface and practice navigating the Linux environment to locate hidden files and analyse log data.

## Environment
- Platform: TryHackMe
- Tools: Linux Command Line

## Approach
First, I used the following command to list all files, including hidden ones, and view their permissions: ls -a -l. This helped me identify a hidden file containing the first flag.

Next, I inspected the authentication logs for any failed login attempts by using: grep "Failed password" on /var/log/auth.log

This allowed me to look for suspicious activity and patterns of brute-force or failed access attempts.

Finally, I switched to the root user and reviewed the root user’s bash history: sudo su - cat /root/.bash_history
The last commands executed by the root user contained another hidden flag.

## Challenges

- Remembering the default location of important Linux logs
- Getting used to using grep effectively to filter large log files
- Understanding file permissions and what they mean

## Flags

THM{learning-linux-cli}
THM{sir-carrotbane-attacks}

## Lessons Learned

1. Each user (including root) has their own .bash_history file
2. How to use the find command to find different files. 

## Further thoughts.

This was a great opener with familiar commands within Linux. It had a few extra I hadn't worked with before as well as learning about /var/log/auth.log/ and .bash_history for analysis.
