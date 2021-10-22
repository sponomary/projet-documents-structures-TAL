(: Construire une requête pour extraire le patron NOM-ADJ :)

<corpus2020>
    {
        for $item in collection('sortieUD-regex_3246')
        for $element in $item//element
        let $next_element := $element/following-sibling::element[1]
        where $element/data[4][contains(text(), "NOUN")] and $next_element/data[4][contains(text(), "ADJ")]
        return <NOM-ADJ>{$element/data[2]/text(), " ", $next_element/data[2]/text()}</NOM-ADJ>
    }
</corpus2020>