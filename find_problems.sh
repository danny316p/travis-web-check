#!/bin/bash


function convert_all_to_markdown() {
    FILE_FORMAT="$@";
    if compgen -G "*.$FILE_FORMAT" > /dev/null; then
        for FILENAME in `ls *.$FILE_FORMAT`; do
            echo "$FILENAME";
            MARKDOWN_VERSION=`sed "s/\.$FILE_FORMAT$/.md/" <<< "$FILENAME"`;
            echo "$MARKDOWN_VERSION";
            lynx --dump "$FILENAME" > "$MARKDOWN_VERSION";
        done;
    else
        echo "No $FILE_FORMAT files found";
    fi
}

function wrap_command() {
    COMMAND="$@";
    echo "Running $COMMAND";
    bash -c "$COMMAND";
    echo "Completed $COMMAND";
}

convert_all_to_markdown "htm";
convert_all_to_markdown "html";
convert_all_to_markdown "xml";

# Now that we've converted everything to text/markdown, we can run text/markdown tools over the results
wrap_command "proselint *.md";
wrap_command "ls";
wrap_command "cat *.md | aspell --list | sort | uniq";

