# Day 17 – CyberChef - Hoperation Save McSkidy

## 🎯 Objectives


- Introduction to encoding/decoding
- Learn how to use CyberChef
- Identify useful information in web applications through HTTP headers

---

## 🖥️ Environment

* **Platform:** TryHackMe
* **Tools used:** CyberChef, Crackstation, Firefox

---

## 🔍 Approach

To get past the first wall, we first decoded the first guard’s name, `CottonTail`, to Base64, which returned `Q290dG9udVGFpbA==`. This was used as the username.

We then used the web developer tools to inspect the HTTPS request. In the `200 OK` response to our HTTP `GET` request, we found an extra header:

`X-Magic-Question: What is the password for this level?`

We converted this to Base64 and submitted it in the chat with the bunny. This revealed the password `SWFtc29mbHVmZnk=`. This didn’t work straight away. After some trial and error, we discovered that the password itself needed to be decoded from Base64 again, which revealed it to be `Iamsofluffy`.


We then proceeded to the outer wall. We encoded the guard’s name (`CarrotHelm`) to Base64, which returned `Q2Fycm90SGVsbQ==`. We checked the `200 GET` request again for the magic question, which was:

`X-Magic-Question: Did you change the password?`

We converted this to Base64 and submitted it in the chat with the guard. This returned another Base64 value:

`Here is the password: U1hSdmJHUjViM1YwYjJOb1lXNW5aV2wwSVE9PQ==`

The password needed to be decoded from Base64 again, which revealed `Itoldyoutochangeit!`.


We then reached the guard house. As before, we encoded the guard’s name (`LongEars`) to Base64, which returned `TG9uZ0VhcnM=`. We checked the HTTPS headers for the `GET` request again, and the only relevant entry we found was:

`X-Recipe-Key: cyberchef`

We then encoded **“What’s the password?”** to Base64 and asked the guard. They returned:

`Here is the password: IQwFFjAWBgsf`

Decoding this from Base64 alone did not produce a readable result. Decoding it from Base64 and then applying an XOR operation with the key `cyberchef` revealed the real password: `BugsBunny`.

We then arrived at the inner castle. As with the previous steps, we encoded the guard’s name (`Lenny`) to Base64, which returned `TGVubnk=`. When we asked the guard for the password, they returned the following (after Base64 decoding):

`Here is the password: b4c0be7d7e97ab74c13091b76825cf39`

Decoding this further using Base64 did not work. We ran the value through Hash Identifier, which showed it was an `MD5` hash. Running this through CrackStation provided us with the password `passw0rd1`.


At the prison tower, we encoded the guard’s name (`Carl`) to Base64, which returned `Q2FybA==`. We checked the `200 GET` response headers again, which provided the following three hints:

- `X-Level: 5`
- `X-Recipe-ID: R2`
- `X-Recipe-Key: cyberchef`

Reading the JavaScript on the page revealed that if `Recipe-ID = R2`, we needed to use the following CyberChef recipe:

`Base64 → From Hex → Reverse`

We then asked the guard for the password again, and they returned (after Base64 decoding):

`Here is the password: NzIzMzZiNjMzMDZjNDI2ODYzMzQzMzcyNDI3MjMxMzU=`

Using the CyberChef recipe from the JavaScript decoded the password to `51rBr34chBl0ck3r`.

This completed the challenge and revealed the final flag.

---
## ⚠️ Challenges

* Learn how CyberChef is used.
* Getting used to decoding different encryption formats
* Learning how to find hints in Javascript as well as HTTPS requests

---

## 🚩 Flags

THM{M3D13V4L_D3C0D3R_4D3P7}

---

## 📚 Lessons Learned

I learned today about different encryption methods and how Cyberchef applies to encode/decode these. I've also learned how to use the web developer tools to inspect the Javascript and the HTTPS requests of a website.

---

## 💭 Further Thoughts

This was quite challenging and took me way longer than expected originally as I was a bit stubborn on trying to figure out how the different encryption methods worked. All in all a good room and it was a nice revisit of the encryption/hash module.
