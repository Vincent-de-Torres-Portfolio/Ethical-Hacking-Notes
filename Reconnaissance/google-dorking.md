
## Google Dorking Cheat Sheet: Beginners Guide to Advanced Querying

### Introduction

Google isn't just a search engine for the surface web; it's a potent tool for advanced queries, unveiling hidden details not easily found through standard searches. This cheat sheet aims to unlock the full potential of Google's search capabilities, offering advanced query examples for various scenarios.

**Disclaimer:**
Using advanced Google queries should be done ethically and within legal boundaries. Respect privacy and avoid using these techniques for malicious purposes.

## Basic Operators

### 1. `inurl:` - Search within the URL

Utilize this operator to discover pages with a specific term in their URLs.

**Example:**
```md
inurl:"preventing cyber threats" site:securityagency
```

**Explanation:**
This query helps you find pages within a specific domain containing the term "preventing cyber threats" in their URLs. Useful for narrowing down results related to cybersecurity on a particular website.

### 2. `site:` - Search within a specific website

Refine your search to a particular domain using the site operator.

**Example:**
```md
"quantum computing explained" site:wired.com
```

**Explanation:**
Narrow your search to a specific website, in this case, Wired.com, to find content specifically about "quantum computing explained" within that domain.

### 3. `filetype:` - Search for specific file types

Focus your search on particular file types.

**Example:**
```md
"artificial intelligence" filetype:PPT
```

### 4. `allinurl:` - Search for all specified words in the URL

Discover pages where all specified words appear in the URL.

**Example:**
```md
allinurl:"web design" "best practices"
```

### 5. `intext:` - Search within the body of the webpage

Find pages that contain specific text within their body.

**Example:**
```md
confidential report intext:"not for public release"
```

## Advanced Operators

### 6. `related:` - Find related websites

Explore websites related to a specific search term.

**Example:**
```md
related:github.com
```

### 7. `info:` - Find supplemental information Google may have

Locate additional information Google may have about a page, useful for finding cached pages.

**Example:**
```md
info:www.cdc.gov
```

### 8. `link:` - Find pages that reference a specific link

Identify other pages indexed by Google that reference a given link.

**Example:**
```md
link:http://www.techblog.com/latestresearch.pdf
```

### 9. `"quote"` - Search for an exact phrase

Look for pages containing an exact phrase, though results may include related words.

**Example:**
```md
"Augmented Reality in Education"
```

### 10. `+word` and `­word` - Include or exclude specific words

Incorporate or exclude exact words in your search results.

**Example:**
```md
Blockchain +Technology
Advanced Blockchain ­guide ­overview ­site:blockchain.org
```

### 11. `"word * word"` - Wildcard search

Search for anything between two words, including both.

**Example:**
```md
"Future * Innovations with *"
```

### 12. `OR (|)` and `AND (&)` - Combine search terms

Use `OR` to return results for either item and `AND` to return results with both items.

**Examples:**
```md
"virtual reality OR augmented reality"
"5G technology AND security"
```

### 13. Combining Operators

Combine multiple operators for more precise searches.

**Example:**
```md
("Index Of" | "[To Parent Directory]") AND "*confidential*" intext:xlsx site:someagency.com
```

