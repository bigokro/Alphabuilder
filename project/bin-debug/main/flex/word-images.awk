/[a-zA-Z]+/ { capitalized = toupper(substr($1, 1, 1)) substr($1, 2); print "[Embed(source=\"../media/words/" tolower($1) ".png\")]\npublic static var WordImage" capitalized ":Class;\n"; };
