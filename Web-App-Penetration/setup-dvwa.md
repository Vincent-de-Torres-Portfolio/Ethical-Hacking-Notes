


# Installing Damn Vulnerable Web Application (DVWA) on Your Linux Distribution

## Introduction

In this tutorial, I'll guide you through the process of setting up Damn Vulnerable Web Application (DVWA) on your Linux distribution. DVWA is a deliberately vulnerable web application designed for security professionals to practice discovering and exploiting common web vulnerabilities.

### Prerequisites

Before we begin, make sure you have the following:

- **Hypervisor:** VirtualBox
- **Linux Distro:** Kali Linux, elementaryOS, or any Linux distribution of your choice

## Step 1: Setup Web Server (Install Apache)

To install Apache, open your terminal and run the following command:

```bash
sudo apt install apache2
```

Once installed, open your web browser and enter `127.0.0.1` to ensure that Apache is running.

## Step 2: Download DVWA

Next, we need to download DVWA from GitHub. If Git is not installed, run:

```bash
sudo apt-get install git
```

Then, navigate to the Apache web folder and clone DVWA:

```bash
cd /var/www/html/
sudo git clone https://github.com/ethicalhack3r/DVWA.git
```

Visit `127.0.0.1/DVWA/` in your browser to confirm the successful installation.

## Step 3: Install MySQL

DVWA requires MySQL. Install it by running:

```bash
sudo apt install mysql-server
```

During the installation, you'll be prompted to set a root password for MySQL.

## Step 4: Install PHP

Install PHP with the following command:

```bash
sudo apt install php5
```

Additionally, install the PHP MySQL extension:

```bash
sudo apt install php5-mysql
```

Restart Apache to apply the changes:

```bash
sudo service apache2 restart
```

## Step 5: Configure DVWA

Edit the DVWA configuration file:

```bash
sudo vim /var/www/html/dvwa/config/config.inc.php.dist
```

Add the database name, user, and password of the MySQL database. Save and exit.

## Step 6: Configure PHP

Edit the PHP configuration file:

```bash
sudo vim /etc/php5/apache2/php.ini
```

Enable `Allow_url_fopen` and `Allow_url_include`. Save and exit.

## Step 7: Restart Services

Restart Apache and MySQL:

```bash
sudo service apache2 restart
sudo service mysql restart
```

## Step 8: Test DVWA Installation

Visit `http://127.0.0.1/DVWA/setup.php` in your browser. You'll be redirected to a setup page. Click on "Create / Reset Database" and log in using the default credentials (admin/password).

## Step 9: Configure Security Levels

Log in to DVWA and adjust the security level according to your preference: Low, Medium, or High. Start with low-level security for initial testing.

## Conclusion

Congratulations! You've successfully installed DVWA on your Linux distribution. Explore the DVWA interface and practice your web security skills.

If you encounter any errors or have questions, feel free to leave a comment below.

