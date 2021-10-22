(: Construire une requête pour extraire le patron PREP-NOM-ADJ :)

<corpus2020>
    {
        for $item in collection('sortieUD-regex_3246')
        for $element in $item//element
        let $next_element := $element/following-sibling::element[1]
        let $next_element2 := $element/following-sibling::element[2]
        where $element/data[4][contains(text(), "ADP")] and $next_element/data[4][contains(text(), "NOUN")] and $next_element2/data[4][contains(text(), "ADJ")]
        return <PREP-NOM-ADJ>{$element/data[2]/text(), " ", $next_element/data[2]/text(), " ", $next_element2/data[2]/text()}</PREP-NOM-ADJ>
    }
</corpus2020>