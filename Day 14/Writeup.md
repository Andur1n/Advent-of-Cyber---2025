# Day 14 – Containers - DoorDasher's Demise

## 🎯 Objectives

- Learn what what containers are and why they are being used.
- Learn how Linux interact with Docker containers
- Learn about the "Container Escape" attack.

---

## 🖥️ Environment

- **Platform:** TryHackMe  
- **Tools used:** Terminal, Docker, Firefox
---

## 🔍 Approach

We started off to see what docker processes were running by using `docker ps`. We then used the command `docker exec -it uptime-checker sh` which opened a shell and allowed us to interact with the uptime-checker container.

We then run `ls -la /var/run/docker/docker.sock` which revealed the permission set `srw-rw---- 1 root`. I did some further digging at this point as I had no idea why I was doing what I was doing.. After further reading I discovered that the **Docker Socket** is the 'Door' to the Docker Daemon (service). Access to the Docker socket from the container would allow access to the Daemon which is a major security risk.

We then switched to the deployer container with bash scripting using the command `docker exec -it deployer bash` followed by `whoami` in order to see what user we are currently logged in as. We are currently logged in as `deployer`. We then ran `sudo /recovery_script.sh` which is a recovery bash script that recovered the website.

Upon then checking the website on http://10.48.148.106:5001 via the attack machine we can see the website has been successfully restored. Going back to the Docker instance, in the same folder as the recovery script we found the flag as well.

---

## ⚠️ Challenges

- Understanding how containers work
- Understanding the commands to interact with the containers and why we were using them.

---

## 🚩 Flags

THM{DOCKER_ESCAPE_SUCCESS}

---

## 📚 Lessons Learned

I learned the difference between a container and a VM today and when to use either of them. We also explored how a container escape attack worked.

---

## 💭 Further Thoughts

I've had no exposure previously to containers or docker so this was a beautiful introduction on why they're being used. I would probably look at experimenting a bit more with it in the future to keep running certain python programs in my home enviroment.
