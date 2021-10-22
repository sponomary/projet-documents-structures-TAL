(: Construire une requête pour extraire les contenus textuels des « descriptions » :)

<corpus2020>
    {
        for $item in collection('sortieUD-regex_3246')//article/description
        let $forme := $item/element/data[2]
        let $description := string-join($forme, " ")
        return (<description>{$description}</description>)
    }
</corpus2020>