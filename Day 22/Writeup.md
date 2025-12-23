# Day 22 – C2 Detection - Command & Carol

## 🎯 Objectives

- Convert a PCAP to Zeek logs
- Use RITA to analyze Zeek logs
- Analyze the output of RITA
 
---

## 🖥️ Environment

- **Platform:** TryHackMe  
- **Tools used:** Zeek, RITA, Terminal
---

## 🔍 Approach

Today we had our first introduction to `RITA` which is another network traffic analysis tool. To get `RITA` to work we would first need to convert the `PCAP` files into `Zeek` files.

We used the below command in terminal to convert the files.

```
zeek readpcap pcaps/rita_challenge.pcap zeek_logs/rita_challenge
```
Now we have the `Zeek` file created we'll need to form a `RITA` database so we can view and start analyzing the file. We ran the below command to process the `Zeek` file into a database ready for `RITA` use.

```
rita import --logs ~/zeek_logs/rita_challenge/ --database rita_challenge
```
We then initiated the file by running the below command which launched `RITA` and loaded our `Zeek` file.

```
rita view rita_challenge
```

In here we were able to scroll through the information and answer the required questions. We then had to built a custom search query. We did this by pressing the `?` which gave us further advise how to built this and we landed on the following query: `dst:rabbithole.malhare.net beacon:>=70 sort:duration-desc`

And that rounds up the task.

---

## ⚠️ Challenges

- Understanding and executing the correct terminal commands.
- Reading and understanding network logs.

---

## 🚩 Flags

No flags today!

---

## 📚 Lessons Learned

I learned about RITA today and how it's used to analyze big pcap files into easily structured format. I also learned how to prepare PCAP files ready for RITA usage.

---

## 💭 Further Thoughts

Exciting new network tool I will be looking to use in my day to day job as it will make filtering out network traffic alot easier (and quicker) than digging through Wireshark.
