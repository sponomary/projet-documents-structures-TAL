(: Construire une requête pour extraire les contenus textuels des titres ET des descriptions :)

<corpus2020>
    {
        for $item in collection('sortieUD-regex_3246')//article
        let $token_titre := $item/titre/element/data[2]
        let $titre := string-join($token_titre, " ")
        let $token_description := $item/description/element/data[2]
        let $description := string-join($token_description, " ")
        return (<titre>{$titre}</titre>, <description>{$description}</description>)
    }
</corpus2020>