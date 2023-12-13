# PowerShell script for hash verification

<#
.SYNOPSIS
    Calculates the hash of a file and verifies it against a downloaded hash.

.DESCRIPTION
    This script calculates the hash of a file using the specified algorithm (default: MD5) and verifies it against a downloaded hash.
    It provides a simple way to check the integrity of a file and detect any corruption or tampering.

.PARAMETER FilePath
    The path to the file for which the hash needs to be calculated and verified.

.PARAMETER Algorithm
    The hash algorithm to use for calculation. Supported algorithms: MD5, SHA1, SHA256, SHA384, SHA512. Default: MD5.

.INPUTS
    None. You will be prompted to enter the file path and the downloaded hash.

.OUTPUTS
    None. The script will display the verification result.

.EXAMPLE
    PS> .\verify_hash.ps1
    Enter the path to your file: C:\path\to\file.txt
    Paste the downloaded hash: 5F4DCC3B5AA765D61D8327DEB882CF99
    Hash verification successful. File integrity maintained.

.NOTES
    - Make sure to have the downloaded hash available before running this script.
    - The downloaded hash should be in the same format as the calculated hash (e.g., lowercase, no dashes).
#>

function Calculate-Hash {
    param (
        [Parameter(Mandatory = $true)]
        [string]$FilePath,

        [string]$Algorithm = "MD5"
    )

    try {
        $fileContent = Get-Content -Path $FilePath -Raw -AsByteStream
        $hashBytes = [System.Security.Cryptography.HashAlgorithm]::Create($Algorithm).ComputeHash($fileContent)
        $hash = [BitConverter]::ToString($hashBytes) -replace '-'
        return $hash.ToLower()
    } catch {
        return "An error occurred: $_"
    }
}

function Main {
    try {
        $filePath = Read-Host "Enter the path to your file"
        $algorithm = Read-Host "Enter the hash algorithm (e.g., md5, sha256 - press Enter for default 'md5')"
        $algorithm = if ($algorithm) { $algorithm } else { "md5" }
        $calculatedHash = Calculate-Hash -FilePath $filePath -Algorithm $algorithm

        $downloadedHash = Read-Host "Paste the downloaded hash (press Enter to skip)"

        if (-not $downloadedHash) {
            Write-Host "Calculated Hash ($algorithm): $calculatedHash"
            return
        }

        if ($calculatedHash -eq $downloadedHash) {
            Write-Host "Hash verification successful. File integrity maintained. Algorithm used: $algorithm"
        } else {
            Write-Host "Hashes do not match. File may be corrupted or tampered with. Algorithm used: $algorithm"
        }
    } catch {
        Write-Host "An error occurred: $_"
    }
}

Main
