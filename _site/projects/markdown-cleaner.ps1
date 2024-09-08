# Get all Markdown files in the current directory
$files = Get-ChildItem -Filter *.md

foreach ($file in $files) {
    # Read the content of the file
    $content = Get-Content $file.FullName -Raw

    # Remove any BOM if present
    $content = $content -replace '^\xEF\xBB\xBF', ''

    # Ensure proper line endings (CRLF for Windows, LF for Unix)
    $content = $content -replace "`r`n", "`n"
    $content = $content -replace "`r", "`n"
    $content = $content -replace "`n", [Environment]::NewLine

    # Remove any trailing spaces
    $content = $content -replace ' +$', ''

    # Ensure there's an empty line after the front matter
    $content = $content -replace "---`r`n`r`n", "---`r`n`r`n`r`n"

    # Write the cleaned content back to the file
    [System.IO.File]::WriteAllText($file.FullName, $content)
}
