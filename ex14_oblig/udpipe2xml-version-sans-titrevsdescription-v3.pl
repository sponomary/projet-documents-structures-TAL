my $first=0;
my $lastposition="";
open(INPUT,"<:encoding(utf-8)",$ARGV[0]);
open(OUTPUT,">:encoding(utf-8)","$ARGV[0].xml");
print OUTPUT "<?xml version=\"1.0\" encoding=\"utf-8\"?>\n";
print OUTPUT "<baseudpipe>\n";
my $first=0;
my $tempvar = "";
my $titre=1;
while (my $ligne=<INPUT>) {
	next if ($ligne=~/^$/);
	$ligne=~s/\r//;
	if ($ligne=~/^([^\t]*)	([^\t]*)	([^\t]*)	([^\t]*)	([^\t]*)	([^\t]*)	([^\t]*)	([^\t]*)	([^\t]*)	([^\t]*)$/) {
		my $a1=$1;
		my $a2=$2;
		my $a3=$3;
		my $a4=$4;
		my $a5=$5;
		my $a6=$6;
		my $a7=$7;
		my $a8=$8;
		my $a9=$9;
		my $a10=$10;
		chomp($a1);chomp($a2);chomp($a3);chomp($a4);chomp($a5);chomp($a6);chomp($a7);chomp($a8);chomp($a9);chomp($a10);
		$a1=~s/&/&amp;/g;
		$a2=~s/&/&amp;/g;
		$a3=~s/&/&amp;/g;
		$a4=~s/&/&amp;/g;
		$a5=~s/&/&amp;/g;
		$a6=~s/&/&amp;/g;
		$a7=~s/&/&amp;/g;
		$a8=~s/&/&amp;/g;
		$a9=~s/&/&amp;/g;
		$a10=~s/&/&amp;/g;
		if (($a1 == 1 and ($lastposition ne "1-2")) or ($a1 eq "1-2")) {
			if($titre == 1) {
				if ($first > 0) {
					print OUTPUT "</description>\n";
					print OUTPUT "</article>\n";
				}
				print OUTPUT "<article>\n";
				print OUTPUT "<titre>\n";
				$titre=0;
			} else {
				if ($first > 0) {
					print OUTPUT "</titre>\n";
				}
				print OUTPUT "<description>\n";
				$titre=1;
			}
		}
		$first++;
		print OUTPUT "<element><data type='id'>$a1</data><data type='form'>$a2</data><data type='lemma'>$a3</data><data type='upos'>$a4</data><data type='xpos'>$a5</data><data type='feats'>$a6</data><data type='head'>$a7</data><data type='deprel'>$a8</data><data type='deps'>$a9</data><data type='misc'>$a10</data></element>\n";
		$tempvar = $a1;
		$lastposition=$a1;
	}
}
close(INPUT);
print OUTPUT "</description>\n</article>\n</baseudpipe>\n";
close(OUTPUT);
