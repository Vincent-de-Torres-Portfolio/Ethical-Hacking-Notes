# DNS Spoofing with Kali Linux and Ettercap: A Step-by-Step Guide

## Introduction
DNS Spoofing, also known as DNS cache poisoning, is a stealthy attack where an attacker manipulates DNS requests to redirect traffic. In this tutorial, we'll explore how to perform DNS Spoofing using Kali Linux and Ettercap, a powerful network sniffing tool. The demonstration involves modifying configuration files, setting up a fake web page, and redirecting DNS traffic to the attacker's machine.

## Disclaimer
This tutorial is for educational purposes only. Unauthorized access and malicious use of network tools are illegal and unethical. Ensure you have proper authorization before attempting any actions described in this tutorial. The information provided is meant to raise awareness about cybersecurity and should not be used for malicious purposes.

## Poison DNS
DNS Spoofing, or DNS cache poisoning, is an attack where a rogue device directs DNS requests on a network. The attacker manipulates DNS to redirect traffic, making detection challenging and the attack dangerous.

## Modify the etter.conf File
Open the terminal on Kali Linux. Locate and edit the etter.conf file using your preferred text editor (e.g., Nano, Vim). Modify `uid` and `gid` values to zero. Uncomment iptables lines for Linux.

```bash
# Locate etter.conf
locate etter.conf

# Open etter.conf using Nano
nano /etc/ettercap/etter.conf
```

Edit the following lines:
```conf
uid = 0
gid = 0
# Uncomment the iptables lines
```

## Edit the etter.dns Host File
Use the terminal to locate and edit the etter.dns file. Add a line to redirect DNS traffic to the attacker's IP address. Comment out unnecessary lines.

```bash
# Locate etter.dns
locate etter.dns

# Open etter.dns using Nano
nano etter.dns
```

Add the following line:
```conf
* A 10.10.10.197
```

## Edit index.html
Navigate to the `var/www/html` directory on Kali Linux. Modify the index.html file to create a fake landing page. Save and close the file.

```bash
# Navigate to the directory
cd /var/www/html

# Edit index.html using Nano
nano index.html
```

## Set up Ettercap
Open Ettercap from Applications > Sniffing & Spoofing. Choose Unified Sniffing and select the network adapter. Stop sniffing and perform a host scan. Add the victim machine to the target list. Manage plugins and activate `dns_spoof`. Set up ARP poisoning in the MITM tab.

## Test on a Windows Machine
Confirm the victim machine's IP address. Launch a web browser and attempt to access a website. Verify that the DNS has been spoofed by checking the redirected page.

## Summary
Recap of the steps taken in the demo. Highlight the configuration changes made on Kali Linux. Emphasize the successful DNS Spoofing demonstration on the Windows machine.

## Conclusion
This tutorial provides a hands-on guide to performing DNS Spoofing using Kali Linux and Ettercap. It underscores the importance of securing DNS infrastructure and the need for vigilance against such stealthy attacks. Users are encouraged to implement robust security measures and stay informed about evolving cybersecurity threats. Remember to use this knowledge responsibly and legally.
