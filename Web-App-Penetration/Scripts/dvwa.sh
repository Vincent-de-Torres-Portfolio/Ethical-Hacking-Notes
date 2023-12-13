#!/bin/bash

# Function to print messages
print_message() {
  echo -e "\033[1;34m$1\033[0m"
}

# Function to install a package
install_package() {
  sudo apt-get install -y $1
}

# Function to clone DVWA from GitHub
clone_dvwa() {
  cd /var/www/html/
  sudo git clone https://github.com/ethicalhack3r/DVWA.git
}

# Function to configure DVWA
configure_dvwa() {
  sudo chmod -R 777 /var/www/html/DVWA/
}

# Function to configure MySQL
configure_mysql() {
  print_message "Configuring MySQL..."
  sudo mysql -u root -p -e "CREATE DATABASE dvwadb;"
  sudo mysql -u root -p -e "CREATE USER 'dvwausr'@'127.0.0.1' IDENTIFIED BY 'dvwar@123';"
  sudo mysql -u root -p -e "GRANT ALL PRIVILEGES ON dvwadb.* TO 'dvwausr'@'localhost' IDENTIFIED BY 'dvwa@123';"
}

# Function to configure PHP
configure_php() {
  print_message "Configuring PHP..."
  sudo sed -i 's/;allow_url_fopen = Off/allow_url_fopen = On/' /etc/php/7.4/apache2/php.ini
  sudo sed -i 's/;allow_url_include = Off/allow_url_include = On/' /etc/php/7.4/apache2/php.ini
}

# Function to restart Apache
restart_apache() {
  sudo service apache2 restart
}

# Function to configure iptables rules
configure_iptables() {
  print_message "Configuring iptables..."
  sudo iptables -A INPUT -p tcp --dport 80 -j ACCEPT
  # Add more rules as needed
  sudo service iptables save
  sudo service iptables restart
}

# Function to install Iceweasel
install_iceweasel() {
  install_package iceweasel
}

# Main script
print_message "Welcome to the DVWA Automated Installation Script!"

# ... (Previous steps remain unchanged)

# New step: Configure iptables rules
configure_iptables

# Completion message
print_message "DVWA Installation Completed!"
print_message "Visit http://127.0.0.1/DVWA/setup.php in your browser to complete the setup."

exit 0
