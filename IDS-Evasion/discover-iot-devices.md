# Scanning for IoT with Nmap: A Comprehensive Guide

In today's interconnected world, networks are filled with a multitude of devices, especially smart IoT (Internet of Things) devices. Regularly scanning your network helps maintain awareness of connected devices and the software they run. In this tutorial, we'll use Nmap, a powerful network scanning tool, to identify and gather information about IoT devices.

## Use Nmap to Find Devices

Let's break down the Nmap command used in the demo:

```bash
nmap -n -Pn -sSU -pT:1-65535,U:1-65535 -v -A <IP_address/subnet_mask>
```

- `-n`: Skip DNS resolution for faster scanning.
- `-Pn`: Treat all hosts as if they're online; do not skip any.
- `-sSU`: Conduct both TCP SYN and UDP scans.
- `-pT:1-65535,U:1-65535`: Specify the range of ports for TCP and UDP scans.
- `-v`: Increase verbosity for detailed output.
- `-A`: Detect OS and version details.

For a quicker scan, consider focusing on a single device and excluding UDP scans:

```bash
nmap -n -Pn -sS -p 1-65535 -v -A <single_IP_address>
```

## Scan Results

Upon completion, analyze the results. Look for open ports and device information. In the demo, TCP ports 80 and 9999 were open on a TP-LINK Smartplug. Note that "tcpwrapped" indicates the device refused communication due to an unauthorized IP address.

Identify the device using the MAC address's first six values, revealing the manufacturer. Extract valuable details like the Linux version (e.g., 2.6.17) for potential vulnerability assessments. In the demo, it was observed that the device had been running for 33 days.

For a comprehensive scan, explore UDP ports, and consider dumping results into a text file for further analysis.

## Summary

In conclusion, Nmap proves invaluable for scanning IoT devices in your network. Understanding the command syntax allows you to tailor scans based on your needs. While a full network scan may take time, modified scans provide quick insights. The tutorial unveiled the significance of terms like "tcpwrapped" and emphasized the importance of documentation for thorough analysis.

Remember, regularly scanning your network helps maintain security awareness and ensures the integrity of your IoT devices.
