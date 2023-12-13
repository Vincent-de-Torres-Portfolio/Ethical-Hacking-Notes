#!/usr/bin/env python3

import hashlib

def calculate_hash(file_path, algorithm='md5'):
    """
    Calculate the hash of a file using the specified algorithm.

    Args:
        file_path (str): The path to the file.
        algorithm (str, optional): The hash algorithm to use. Defaults to 'md5'.

    Returns:
        str: The calculated hash value.
    """
    try:
        hash_algo = hashlib.new(algorithm)
        with open(file_path, 'rb') as file:
            while chunk := file.read(8192):
                hash_algo.update(chunk)
        return hash_algo.hexdigest()
    except Exception as e:
        return str(e)

def main():
    """
    Main function to verify the integrity of a file using hash values.
    """
    try:
        file_path = input("Enter the path to your file: ")
        algorithm = input("Enter the hash algorithm (e.g., md5, sha256 - press Enter for default 'md5'): ") or 'md5'
        calculated_hash = calculate_hash(file_path, algorithm)

        # Assuming you have the downloaded hash stored in MD5checksum.txt
        downloaded_hash = input("Paste the downloaded hash (press Enter to skip): ")

        if not downloaded_hash:
            print(f"Calculated Hash ({algorithm}): {calculated_hash}")
            return

        if "unknown hash algorithm" in calculated_hash:
            print(calculated_hash)
            return

        if calculated_hash == downloaded_hash:
            print(f"Hash verification successful. File integrity maintained. Algorithm used: {algorithm}")
        else:
            print(f"Hashes do not match. File may be corrupted or tampered with. Algorithm used: {algorithm}")
    except Exception as e:
        print(f"An error occurred: {e}")

if __name__ == "__main__":
    main()
