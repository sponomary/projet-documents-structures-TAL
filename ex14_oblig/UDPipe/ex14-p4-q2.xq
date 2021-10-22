(: Construire une requête pour extraire les contenus textuels des « titres » :)

<corpus2020>
    {
        for $item in collection('sortieUD-regex_3246')//article/titre
        let $forme := $item/element/data[2]
        let $titre := string-join($forme, " ")
        return (<titre>{$titre}</titre>)
    }
</corpus2020>