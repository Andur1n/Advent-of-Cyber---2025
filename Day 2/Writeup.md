# Day 2 – Phishing - Merry Clickmas

## Objective

Todays objective was to get familiar with how email phishing scams operate and how they're performed.

## Environment
- Platform: TryHackMe
- Tools: Linux Command Line and Social Engineering Toolkit (https://github.com/trustedsec/social-engineer-toolkit)

## Approach
The first step we took was to get a web server running on our machine by running the server.py file in the AoC2025 folder. Once we had this up and running we cross checked if this worked by
entering the  loopback IP address (http://127.0.0.1:8000) in the local web browser.

Once this was running we started setoolkit in a seperate window and used the mailer tool to spoof the updates@flyingdeer.thm address and send the victim an e-mail containing a link to the malicious web server.

After 1-2 minutes an attempt was made to login into our malicious web portal and we obtained the login details. We then discovered the password was re-used for their factory account as well.

## Challenges

- Filling in the correct details into the social engineering toolkit.

## Flags

No flags today!

## Lessons Learned

1. Read carefully what the options say. There's alot of options available sometimes and not filling in the right details can mess up your plans.

## Further thoughts.

I liked playing the role of the attacker today and was suprised how simple it is to run a phishing scam. I've bookmarked the Social Engineering Toolkit link as I'd like to see what more the program is capable off.
