# Performing a Man-in-the-Middle DHCP Attack: A Practical Demonstration

## Introduction
Man-in-the-middle attacks, or MITM attacks, are diverse and can take various forms, such as ARP spoofing and DNS spoofing. In this demonstration, we will illustrate how to position ourselves between a victim and the default gateway to capture network traffic. Using Ettercap, we will focus on spoofing the default gateway when a victim machine attempts to obtain an IP address from a DHCP server.

## Disclaimer
**Disclaimer:**

The information provided in this demonstration and accompanying tutorial is intended for educational purposes only. The demonstration illustrates a man-in-the-middle (MITM) DHCP attack using tools such as Zenmap, Ettercap, and Wireshark. Unauthorized access, interception of network traffic, and malicious use of network tools are illegal and unethical.

The use of such techniques without proper authorization is strictly prohibited and may lead to legal consequences. Network administrators and security professionals should be aware of these potential threats and take appropriate measures to secure their networks.

The tutorial is not an endorsement of any malicious activities, and the content is meant to raise awareness about cybersecurity vulnerabilities. Users are strongly advised to seek authorization before attempting any actions described in this tutorial. The responsibility for the ethical and legal use of this information rests solely with the user.

The creators and contributors of this tutorial are not liable for any misuse or unauthorized activities performed based on the information provided. Users are encouraged to abide by ethical guidelines, respect privacy and legal boundaries, and use their knowledge for constructive purposes in accordance with applicable laws and regulations.

## Scan Subnet with Zenmap
Before initiating the MITM DHCP attack, it's crucial to identify the network topology. We'll begin by scanning the subnet using Zenmap, a GUI version of the Nmap command-line tool.

```bash
# Launch Zenmap from Applications > Information Gathering
zenmap

# Perform a Quick Scan on the subnet
nmap -sP 10.10.10.0/24
```

Identify the router (default gateway), victim machine, and the attacking machine's IPs. Take note of these IPs for later use.

## Start Spoofing
Now, let's initiate the spoofing process using Ettercap. Open Ettercap from Applications > Sniffing & Spoofing.

```bash
# Open Ettercap and go to the Sniff tab
ettercap

# Select Unified Sniffing and DHCP Spoofing
```

Configure DHCP Spoofing settings in the dialog box, leaving the IP pool empty and specifying the subnet's netmask and DNS server info. Click OK to start DHCP spoofing.

## The Windows 10 Victim
Switch to a Windows 10 victim machine to observe the effects of the DHCP spoofing.

```bash
# Open an elevated command prompt
ipconfig /release
ipconfig /renew
```

Verify that the default gateway has changed, indicating successful DHCP spoofing.

## Verify that MITM is Working
Back on the Kali Linux system, observe the captured traffic in Ettercap to confirm that usernames and passwords are being intercepted.

## Recognize Spoofing with Wireshark
Use Wireshark to examine DHCP traffic and detect the spoofed DHCP server.

```bash
# Launch Wireshark from Applications > Spoofing & Sniffing
wireshark
```

Filter DHCP traffic by entering 'bootp'. Observe the DHCP acknowledgment, revealing the spoofed router IP.

## Summary
In this demonstration, we utilized Ettercap to perform a man-in-the-middle attack by spoofing the default gateway during the DHCP process. We confirmed the success of the attack by checking the victim's changed default gateway and further validated it using Wireshark to detect the altered DHCP information. It highlights the importance of securing DHCP infrastructure to prevent MITM attacks. Always use such knowledge responsibly and adhere to ethical standards.

