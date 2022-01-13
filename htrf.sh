#!/bin/bash

# The Kennel Club
# Health Test Results Finder

name="$1"
tmpfile="htrf.tmp.$$"
query="$2"

get_page_count() {
    name="$1"

    echo "Getting total page count" 1>&2
    curl "https://www.thekennelclub.org.uk/search/health-test-results-finder/?Filter=$1" -o "$tmpfile" 2>/dev/null
    result=$(xmllint --html --xpath '//span[@class="m-pagination__status"]/text()' "$tmpfile" 2>/dev/null | tr -d '\n' | sed 's/.*[0-9]\+ of \([0-9]\+\).*/\1/')

    echo "$result pages" 1>&2
    echo "$result"
}

pages=$(get_page_count "$name")

get_dog_page() {
    name="$1"
    page="$2"
    curl "https://www.thekennelclub.org.uk/search/health-test-results-finder/?Filter=${1}&pageNumber=${2}" -o "$tmpfile" 2>/dev/null
    
    names=$(xmllint --html --xpath '//div[@class="m-dog-card"]/a/div/div[2]/strong/text()' "$tmpfile" 2>/dev/null)
    breeds=$(xmllint --html --xpath '//div[@class="m-dog-card"]/a/div/div[2]/div/text()' "$tmpfile" 2>/dev/null)
    sexes=$(xmllint --html --xpath '//div[@class="m-dog-card"]/div/div/dl/div[1]/dd/text()' "$tmpfile" 2>/dev/null)
    colours=$(xmllint --html --xpath '//div[@class="m-dog-card"]/div/div/dl/div[2]/dd/text()' "$tmpfile" 2>/dev/null | sed 's/&amp;/and/')
    births=$(xmllint --html --xpath '//div[@class="m-dog-card"]/div/div/dl/div[3]/dd/text()' "$tmpfile" 2>/dev/null | sed -n '0~2p')
    ids=$(for ((n=1; n<=$(echo "$names" | wc -l); n++)) do echo "$page"; done)

    pr -tm -s'|' <(echo "$ids") <(echo "$names") <(echo "$breeds") <(echo "$sexes") <(echo "$colours") <(echo "$births")
}

get_dog_all_pages() {
    name=$1
    echo "Downloading and parsing pages:" 1>&2
    
    for page in $(seq "$pages"); do
	get_dog_page "$name" $page
	printf "%d " "$page" 1>&2
    done
    echo 1>&2
}

get_dog_all_pages "$name" | column -t -s'|' | grep -Ei "$query"

rm -rf "$tmpfile"
