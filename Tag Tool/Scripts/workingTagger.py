# A bit cryptic, but this is 1.0 of this tagging system that I will be using.
# It's a command line tool, but I'll slap a simple GUI on top of it for ease
# of use.

import csv
import sys


def tag_tool(path, col_from, col_to, tag, replace, trans_type, output):
    transaction_type_table = {'ap': (lambda x: x + (', ' + replace)), 'er': (lambda x: replace)}
    trans_function = transaction_type_table[trans_type]
    with open(path, 'r', newline="", encoding='utf-8') as csv_file:
        reader = csv.DictReader(csv_file, delimiter=',')
        writer = csv.DictWriter(open(output, 'w', encoding='utf-8'), fieldnames=reader.fieldnames)
        writer.writeheader()
        for row in reader:
            if row[col_from] != "" and row[col_to] != "":
                if tag.lower() in row[col_from].lower():
                    row[col_to] = trans_function(row[col_to])
                    print(col_from + ': ' + row[col_from] + '\n' + col_to + ': ' + row[col_to] + '\n')
            writer.writerow(row)


def main(argv):
    if len(argv) == 8:
        tag_tool(argv[1], argv[2], argv[3], argv[4], argv[5], argv[6], argv[7])
    else:
        print("Not the correct number of arguments")


if __name__ == '__main__':
    main(sys.argv)
