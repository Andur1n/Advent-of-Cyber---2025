# Day 5 – Santa’s Little IDOR

## Objective

- Understand the concept of authentication and authorization  
- Learn how to spot potential opportunities for Insecure Direct Object References (IDORs)  
- Exploit an IDOR to perform horizontal privilege escalation  
- Learn how to turn IDOR into SDOR (Secure Direct Object Reference)  

## Environment

- **Platform:** TryHackMe  
- **Tools:** Firefox  

## Approach

In the first section, we were given an explanation of what IDORs are and how they work. A further explanation was then provided, describing this vulnerability along with the difference between horizontal and vertical privilege escalation.

We followed this up by logging into the controlled environment, where we were presented with a website containing this exact vulnerability. We then used the browser’s developer tools to identify what login data was being sent to the server in our HTTP request.

We accessed our cookies (local storage data) and amended the `USER_ID` field to a different value. This allowed us to view different user accounts, demonstrating a clear example of horizontal privilege escalation.

The challenge then finished with an explanation that the data we had been seeing in this challenge can be hashed, along with an example of what this would look like in practice.

## Challenges

- Learning what IDOR challenges are.  
- Learning how to use the developer tools and finding the correct information required to progress in the challenge.  

## Flags

No flags today.

## Lessons Learned

I have learned what an IDOR vulnerability is and how it can be exposed and exploited by attackers. I have also learned more about the developer tools and what some of the data within them represents.

This challenge also reinforced the importance of proper server-side authorization checks and why applications should never rely on client-side values (such as cookies or URL parameters) for access control decisions.

## Further Thoughts

This was a really refreshing room, and I really enjoyed the subject, as I have not done much with web server exploitation before. It was something I vaguely understood, but it was great to see both the theory and the vulnerability in action.
