# Day 4 – AI in Security - old sAInt nick

## Objective

- Learn how AI is used in the Cybersecurity space.
- Apply some of the examples of how AI is being used.
- Learn about some considerations and limitations of AI

## Environment

- Platform: TryHackMe
- Tools: SolveIT (customer TryHackMe AI), Terminal.


## Approach

We first got a little read which explained how AI is used within the Cybersecurity space and to be careful not to have it fully replace the people part.

Then with the hands-on examples we first generated a Python SQL injection code. I created a file for this within the Linux directory, amended the target IP address and then ran the code. This provided me with the first flag.

On the second example we prompted the AI to investigate the attack we had just performed. This brought back the exact details and script of the attack.

During the last example it analyzed our application to see where the vulnerabilities were.


## Challenges

- Providing AI with the right prompts to get the correct results

## Flags

THM{AI_MANIA}
THM{SQLI_EXPLOIT}


## Lessons Learned

We've been taught about how AI can be used within the Cybersecurity space in order for humans to focus on the important tasks.

## Further Thoughts

This room was definitely not my favourite. The AI was a bit slow to react and it was very much a "hands off" room without much interaction. It was very good to see what the capabilities are of AI within the Cybersecurity space.

I am extremely new to SIEMs, and this was a great first experience with Splunk. The challenge took longer to complete due to unfamiliarity with the tool, the attacker mindset, and common attack patterns. However, it provided an excellent introduction to SIEM analysis and real-world investigation techniques.
