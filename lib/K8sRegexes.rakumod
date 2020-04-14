
regex k8s-obj {
    [$<kind>=(<.alpha>+) "/"]?
    $<name>=(
        <.alnum>+ "-"
        [<.xdigit>+ "-" <.alnum>+]
    )
}

