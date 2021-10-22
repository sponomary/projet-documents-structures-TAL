(: Construire une requête pour extraire les contenus textuels des descriptions :)

<corpus2017>
    {
        for $item in collection("3208-2017-v2")//item
        for $description in $item//description/article
        let $data := string-join($description/element/data[3], ' ')
        return <description>{$data}</description>
    }
</corpus2017>