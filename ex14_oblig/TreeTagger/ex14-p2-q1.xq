(: Construire une requête pour extraire les patrons morpho-syntaxiques NOM PRP NOM :)

<corpus2017>
    {
        for $item in collection("3208-2017-v2")//item
        for $titre in $item//titre/article
        let $data := string-join($titre/element/data[3], ' ')
        return <titre> {$data} </titre>
    }
</corpus2017>