#!/bin/sh

# Updates authors.md based on git history
# Forked from @feross's https://github.com/webtorrent/webtorrent/blob/master/bin/update-authors.sh

git log --reverse --format='%aN (<%aE>)' | perl -we '

BEGIN {
  %seen = (), @authors = ();
}
while (<>) {
  next if $seen{$_};
  $seen{$_} = push @authors, "- ", $_;
}
END {
  print "## Project Authors :tada:\n\n";
  print @authors, "\n";
  print "Ordered by oldest contribution - Generated by `bin/update-authors.sh` :rocket:\n";
}

' > ../authors.md
