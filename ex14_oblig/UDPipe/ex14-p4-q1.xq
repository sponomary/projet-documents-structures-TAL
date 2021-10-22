(: Construire une requête pour compter le nombre de titres, le nombre de descriptions. :)

<corpus2020>
    {
        for $item in collection("sortieUD-regex_3246")
        let $titres := count($item//titre)
        let $descriptions := count($item//description)
        return (<nb_titres>{$titres}</nb_titres>, <nb_descriptions>{$descriptions}</nb_descriptions>)
    }
</corpus2020>