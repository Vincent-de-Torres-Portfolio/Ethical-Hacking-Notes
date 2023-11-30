# Wireshark Filter Index for Analyzing DDoS Attacks

Wireshark is a powerful network protocol analyzer that allows you to capture and inspect the data traveling back and forth on your network. When dealing with DDoS attacks, it's crucial to be able to identify and analyze specific patterns in the network traffic. Below is a guide providing Wireshark filters for common DDoS attack types, including SYN floods, Smurf attacks, and ICMP (ping) floods.

## SYN Flood Analysis

A SYN flood is a type of DDoS attack where the attacker overwhelms the target server by sending a large number of TCP connection requests, but never completing the connection handshake. To filter for SYN flood packets in Wireshark, use the following display filter:

```plaintext
tcp.flags.syn == 1 && tcp.flags.ack == 0
```

This filter captures packets where the SYN flag is set (indicating a connection request) and the ACK flag is not set (indicating the initial acknowledgment).

## Smurf Attack Analysis

A Smurf attack involves exploiting Internet Control Message Protocol (ICMP) to flood a target system with traffic. To filter for Smurf attack packets in Wireshark, use the following display filter:

```plaintext
icmp.type == 8 && ip.dst == broadcast
```

This filter captures ICMP Echo Request packets (ping) sent to the broadcast address, which is a characteristic of Smurf attacks.

## ICMP (Ping) Flood Analysis

Ping floods involve overwhelming a target with ICMP Echo Request (ping) packets. To filter for ICMP flood packets in Wireshark, use the following display filter:

```plaintext
icmp.type == 8
```

This filter captures ICMP Echo Request packets, which are indicative of a ping flood.

## UDP Flood Analysis

UDP floods involve overwhelming a target with a large number of User Datagram Protocol (UDP) packets. To filter for UDP flood packets in Wireshark, use the following display filter:

```plaintext
udp
```

This filter captures all UDP packets, allowing you to analyze the volume and characteristics of UDP traffic.

## DNS Amplification Attack Analysis

DNS amplification attacks exploit open DNS resolvers to flood a target with amplified DNS response traffic. To filter for DNS amplification attack packets in Wireshark, use the following display filter:

```plaintext
udp.port == 53 && dns.flags.response == 1 && dns.flags.ra == 1 && dns.qry.name
```

This filter captures UDP packets on port 53 (DNS), where the packet is a DNS response with the "Recursion Available" and "Response" flags set.

## Wireshark Filter Index

Here's a table summarizing the Wireshark filters for DDoS attack analysis:

| Attack Type                  | Wireshark Filter                                                   |
|------------------------------|--------------------------------------------------------------------|
| SYN Flood                    | `tcp.flags.syn == 1 && tcp.flags.ack == 0`                         |
| Smurf Attack                 | `icmp.type == 8 && ip.dst == broadcast`                            |
| ICMP (Ping) Flood             | `icmp.type == 8`                                                   |
| UDP Flood                    | `udp`                                                               |
| DNS Amplification Attack     | `udp.port == 53 && dns.flags.response == 1 && dns.flags.ra == 1 && dns.qry.name` |

## Conclusion

Wireshark provides a powerful set of tools for analyzing network traffic, making it an invaluable resource for understanding and mitigating DDoS attacks. By employing these filters, you can focus on specific characteristics associated with various DDoS attack types. Remember to use Wireshark responsibly and within the bounds of applicable laws and policies. Stay vigilant, and keep your network secure.

