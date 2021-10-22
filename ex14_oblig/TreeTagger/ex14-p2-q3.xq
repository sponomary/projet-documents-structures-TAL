(: Construire une requête pour extraire les contenus textuels des titres ET des descriptions :)

<corpus2017>
    {
        for $item in collection("3208-2017-v2")//item
        for $titre in $item/titre/article
        let $titre := string-join($titre/element/data[3], ' ')
        for $description in $item//description/article
        let $description := string-join($description/element/data[3], ' ')
        return
            <item>
                <titre>{$titre}</titre>
                <description>{$description}</description>
            </item>
    }
</corpus2017>