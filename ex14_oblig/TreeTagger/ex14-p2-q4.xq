(: Construire une requête pour extraire les patrons morpho-syntaxiques NOM ADJ :)

<corpus2017>
    {
        for $item in collection("3208-2017-v2")//item
        for $element in $item//article/element
        let $next_element := $element/following-sibling::element[1]
        where $element/data[1][contains(text(), "NOM")] and $next_element/data[1][contains(text(), "ADJ")]
        return <NOM-ADJ>{$element/data[3]/text(), " ", $next_element/data[3]/text()}</NOM-ADJ>
    }
</corpus2017>