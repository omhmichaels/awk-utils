
# set the field separator to a regular expression that includes whitespace and punctuation:
BEGIN {
        # ignore 1 or more consecutive occurrences of the characters
        # in the character group below
        FS="[ .,:;()<>{}@!\"'\t]+";
}


# main loop function will iterate over each field, ignoring any empty fields (which happens if there is punctuation at the end of a line), and increment the word count for the words in the line.
{
        #proposer["firstname"]=$1;
        #proposer["lastname"]=$2;
        #proposer["email"]=$3;
        #proposer["title"]=$4;

        for (i = 1; i <= NF; i++) {
                if ($i != "") {
                        words[$i]++;
                }
        }
}

# use the END function to print the contents of the array, then use awk's capability of piping output into a shell command to do a numerical sort and print the 20 most frequently occurring words:
END {
        sort_head = "sort -k2 -nr | head -n 20";
        for (word in words) {
                printf "%s\t%d\n", word, words[word] | sort_head;
        }
        close (sort_head);
}