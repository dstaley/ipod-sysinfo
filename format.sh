#!/bin/bash

find models -name "*.plist" -type f -print0 | while IFS= read -r -d '' file; do
    xmllint --format "$file" --output "$file"
    sed -i '' 's|<string/>|<string></string>|g' "$file"
    sed -i '' 's|<key/>|<key></key>|g' "$file"
done
