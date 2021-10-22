(: Construire une requête pour extraire les patrons morpho-syntaxiques NOM PRP NOM :)

<corpus2017>
    {
        for $item at $i in collection("3208-2017-v2")//item
        for $element in $item//article/element
        let $next_element := $element/following-sibling::element[1]
        let $next_element2 := $element/following-sibling::element[2]
        where $element/data[1][contains(text(), "NOM")] and $next_element/data[1][contains(text(), "PRP")] and $next_element2/data[1][contains(text(), "NOM")]
        return <NOM-PRP-NOM>{$element/data[3]/text(), " ", $next_element/data[3]/text(), " ", $next_element2/data[3]/text()}</NOM-PRP-NOM>
     }
</corpus2017>