
unit module K8sRegex;

our token kind is export { [<.alpha>+]+ % "." }
our token name is export { <.alnum>+ }
our token tail is export { [<.xdigit>+ "-" <.alnum>+] }
our token pod  is export { <kind> "/" <name> "-" <tail> }

class act {
    method TOP ($/) {
        note $/;
        my %obj = %(
            kind => $/<kind>.made,
            name => $/<name>.made,
            tail => $/<tail>.made,
        );
        make %obj;
    }
    method kind ($/) {
        my $kind = $/.Str;
        make $kind;
    }
    method name ($/) {
        my $name = $/.Str;
        make $name;
    }
    method tail ($/) {
        my $tail = $/.Str;
        make $tail;
    }
}

our sub query-pod ($s, $attr, $match) is export {
    race for $s.lines.grep(* ~~ / <pod> /).map(* ~~ / <pod> /) -> $m {
        if $m<pod>{$attr} ~~ $match {
            say $m<pod>.Str;
        }
    }
}


