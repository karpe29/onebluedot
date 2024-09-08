# Read the CSV file
$csv = Import-Csv "WEBSITE PROJECT DESCRIPTION - web info (1).csv"

# Function to convert string to kebab-case
function Convert-ToKebabCase {
    param([string]$inputString)
    $inputString -replace '\s+', '-' -replace '[^\w\-]', '' -replace '-+', '-' | ForEach-Object { $_.ToLower() }
}

# Process each row in the CSV
foreach ($row in $csv) {
    # Skip empty rows
    if (-not $row.title) { continue }

    # Create the content with front matter
    $content = @"
---
layout: project
title: $($row.title)
category: $($row.category)
location: $($row.Location)
year: $($row.Year)
status: $($row.Status)
cover_image: $($row.'Cover-Image')
tagline: $($row.'TAG LINE')
---

$($row.DESCRIPTION)
"@

    # Generate a filename based on the title
    $filename = Convert-ToKebabCase -inputString $row.title
    $outputFile = "$filename.md"

    # Write the content to a new Markdown file using UTF-8 encoding without BOM
    [System.IO.File]::WriteAllLines($outputFile, $content)
}