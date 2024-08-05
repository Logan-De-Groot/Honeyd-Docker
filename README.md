# Honeyd-Docker

A basic docker container to setup and run `honeyd` honeypot which can be found here: https://github.com/DataSoft/Honeyd.git

Steps:

1. Do `./deploy.sh` to build the docker image and run it 

Verification that its working can be done via `nmap localhost` and results should be akin to the following:
```
Starting Nmap 7.80 ( https://nmap.org )
Nmap scan report for localhost (127.0.0.1)
Host is up (0.000029s latency).
Not shown: 985 closed ports
PORT     STATE SERVICE
22/tcp   open  ssh
25/tcp   open  smtp
80/tcp   open  http
110/tcp  open  pop3
143/tcp  open  imap
443/tcp  open  https
587/tcp  open  submission
993/tcp  open  imaps
995/tcp  open  pop3s
3306/tcp open  mysql
3389/tcp open  ms-wbt-server
5432/tcp open  postgresql
8000/tcp open  http-alt
8080/tcp open  http-proxy
9000/tcp open  cslistener

Nmap done: 1 IP address (1 host up) scanned in 0.03 seconds
```


Initial set up was taken from `frikky` with the repo: https://github.com/frikky/honeydocker. Some updates and fix up of the docker image were done to get it to work in 2024.
