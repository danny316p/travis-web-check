#!/bin/bash


function convert_all_to_markdown() {
    FILE_FORMAT="$@";
    for FILENAME in `ls *.$FILE_FORMAT`; do
        echo "$FILENAME";
        MARKDOWN_VERSION=`sed "s/\.$FILE_FORMAT$/.md/" <<< "$FILENAME"`;
        echo "$MARKDOWN_VERSION";
        lynx --dump "$FILENAME" > "$MARKDOWN_VERSION";
    done;
}

convert_all_to_markdown "htm";
convert_all_to_markdown "html";
convert_all_to_markdown "xml";

# Now that we've converted everything to text/markdown, we can run text/markdown tools over the results
proselint *.md
cat *.md | aspell --list

