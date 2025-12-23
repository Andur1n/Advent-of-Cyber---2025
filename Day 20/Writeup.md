# Day 20 – Race Conditions - Toy to The World

## 🎯 Objectives

- Understand what race conditions are and how they can affect web applications.
- Learn how to identify and exploit race conditions in web requests.
- How concurrent requests can manipulate stock or transaction values.
- Explore simple mitigation techniques to prevent race condition vulnerabilities.

---

## 🖥️ Environment

- **Platform:** TryHackMe  
- **Tools used:** Firefox, Burp Suite
---

## 🔍 Approach

First we learned about race conditions on how these work, what's causing it and how to exploit it.

We then had to exploit this vulnerability for ourselves. We started by enabling `Foxyproxy` and `Burp Suite` in order to capture our `HTTP` requests. We turned "Intercept" off to make sure that `Burp Suite` doesn't hold our `HTTP` requests.

To exploit the vulnerability we first created a legitimate request by ordering the "SleighToy Limited Edition" and pay for the product. This created a real `POST` request in `Burp Suite` that contained the details of our order.

We then send this exact post request to the repeater in `Burp Suite` and duplicated it 15 times. We then advised the repeater we wanted to run all requests in parallel to each other so they would arrive at the web server at the same time. Once ran we ran this we could see the "SleighToy Limited Edition" stock value was now -7 revealing the first flag.

We then repeated this exact process but now for the "Bunny Plush (Blue)" which then gave us the second flag.

---

## ⚠️ Challenges

- Using Burp Suite to analyze HTTP requests.

---

## 🚩 Flags

- THM{WINNER_OF_R@CE007}
- THM{WINNER_OF_Bunny_R@ce}
  
---

## 📚 Lessons Learned

Learned what race conditions are and how these are problematic and exploitable.

We also learned how we can analyze and amend HTTP requests with Burp Suite.

---

## 💭 Further Thoughts

I always love when a new useful tool gets added and today that was Burp Suite. Very interested to learn more about it's functionality down the line.
