
unit module K8sRegex;

# Example:
#   cmd='use K8sRegex; slurp() ~~ &pod; say "pod/" ~ $/<name>.Str'
#   kubectl get pods | raku -e $cmd
my regex pod is export {
    $<kind>=( [<.alpha>+]+ % "." )
    "/"
    $<name>=( <.alnum>+ )
    "-"
    $<tail>=( [<.xdigit>+ "-" <.alnum>+] )
}

our sub get-pods (Str:D $s) is export {
   $s.lines.map(*~~/$<pod>=<&pod>/).grep(*!~~Nil)
}

