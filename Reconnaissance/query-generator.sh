#!/bin/bash
clear

generate_google_dork() {
    echo "----------------------------------------------------------"

    echo "Welcome to the Advanced Google Dork Generator!"
    echo "----------------------------------------------------------"
    echo "Enter search parameters to generate a Google Dork."
    echo "----------------------------------------------------------"
    echo "----------------------------------------------------------"

    # Get user input for different parameters
    read -p "Enter the main search query: " query
    read -p "Limit search to a specific site (optional, press Enter for none): " site
    read -p "Search for specific file types (optional, press Enter for none): " filetype
    read -p "Search for specific text within the page (optional, press Enter for none): " intext
    read -p "Include terms (optional, press Enter for none): " include_terms
    read -p "Exclude terms (optional, press Enter for none): " exclude_terms
    read -p "Specify a date range (optional, e.g., after:2022-01-01, press Enter for none): " date_range
    read -p "Generate hyperlink with the Google Dork as a search parameter? (y/n): " generate_link

    # Validate user input for the main search query
    if [[ -z $query ]]; then
        echo "Error: Main search query cannot be empty."
        return 1
    fi

    # Generate the Google Dork
    google_dork="${query}"
    append_if_non_empty() {
        if [[ -n $1 ]]; then
            google_dork+=" $2:${1// /%20}"
        fi
    }

    append_if_non_empty "$site" "site"

    # Allow multiple items to be provided
    handle_multiple_items() {
        local input_variable=$1
        local operator=$2
        local prompt_message=$3

        if [[ -n ${!input_variable} ]]; then
            echo "$prompt_message"
            echo "For example, to include 'term1' and 'term2', enter 'term1,term2'."
            IFS=',' read -ra items <<< "${!input_variable}"
            for item in "${items[@]}"; do
                append_if_non_empty "$item" "$operator"
            done
        fi
    }

    handle_multiple_items "filetype" "filetype" "Multiple file types can be provided by separating them with commas."
    handle_multiple_items "intext" "intext" "Multiple terms for text search can be provided by separating them with commas."
    handle_multiple_items "include_terms" "" "Multiple terms to include can be provided by separating them with commas."
    handle_multiple_items "exclude_terms" "-" "Multiple terms to exclude can be provided by separating them with commas."

    append_if_non_empty "$date_range" "daterange"

    echo -e "\n"
    echo "-----------------------------------"
    echo "Generated Google Dork:"
    echo "${google_dork}"
    echo "-----------------------------------"

    # Generate hyperlink if requested
    if [[ $generate_link == "y" ]]; then
        encoded_dork=$(echo "${google_dork}" | sed 's/ /%20/g')
        search_link="https://www.google.com/search?q=${encoded_dork}"
        echo "Generated Search Link:"
        echo "${search_link}"
    fi
}

generate_google_dork
