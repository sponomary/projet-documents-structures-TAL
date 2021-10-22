(: Construire une requête pour extraire le patron VERBE-PREP-DET-NOM :)

<corpus2020>
    {
        for $item in collection('sortieUD-regex_3246')
        for $element in $item//element
        let $next_element := $element/following-sibling::element[1]
        let $next_element2 := $next_element/following-sibling::element[1]
        let $next_element3 := $next_element2/following-sibling::element[1]
        where $element/data[4][contains(text(), "VERB")] and $next_element/data[4][contains(text(), "ADP")] and $next_element2/data[4][contains(text(), "DET")] and $next_element3/data[4][contains(text(), "NOUN")]
        return <VERBE-PREP-DET-NOM>{$element/data[2]/text(), " ", $next_element/data[2]/text(), " ", $next_element2/data[2]/text(), " ", $next_element3/data[2]/text()}</VERBE-PREP-DET-NOM>
    }
</corpus2020>