#!/bin/bash

# Function to calculate the hash of a file using the specified algorithm
# Arguments:
#   $1: file_path - The path to the file
#   $2: algorithm - The hash algorithm to use (e.g., md5, sha256)
# Returns:
#   The calculated hash value
calculate_hash() {
    file_path=$1
    algorithm=$2
    try {
        hash=$(openssl dgst -"$algorithm" "$file_path" | awk '{print $2}')
        echo "$hash"
    } catch {
        echo "unknown hash algorithm: $algorithm"
    }
}

# Main function to verify the integrity of a file using a downloaded hash
main() {
    try {
        read -p "Enter the path to your file: " file_path
        read -p "Enter the hash algorithm (e.g., md5, sha256 - press Enter for default 'md5'): " algorithm
        algorithm=${algorithm:-md5}
        calculated_hash=$(calculate_hash "$file_path" "$algorithm")

        # Assuming you have the downloaded hash stored in MD5checksum.txt
        read -p "Paste the downloaded hash (press Enter to skip): " downloaded_hash

        if [ -z "$downloaded_hash" ]; then
            echo "Calculated Hash ($algorithm): $calculated_hash"
            return
        fi

        if [[ $calculated_hash == *"unknown hash algorithm"* ]]; then
            echo $calculated_hash
            return
        fi

        if [ "$calculated_hash" == "$downloaded_hash" ]; then
            echo "Hash verification successful. File integrity maintained. Algorithm used: $algorithm"
        else
            echo "Hashes do not match. File may be corrupted or tampered with. Algorithm used: $algorithm"
        fi
    } catch {
        echo "An error occurred: $@"
    }
}

# Call the main function
main
