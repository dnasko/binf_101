#!/usr/bin/perl
use strict;
use POSIX;
use LWP::Simple;
$|=1;      # forces print output to be sent to screen in real-time


#----------------------USER VARIABLES-----------------------
my $query   = $ARGV[0];
my $subject = $ARGV[1];

#---------------------GLOBAL VARIABLES----------------------
my @M;            # alignment matrix; filled by similarity scores
my $match = 2.25; # match bonus
my $g = -0.50;    # gap penalty
my $mismatch = -0.75;   # mismatch penalty

#-----------------------------------------------------------
#---------------------------MAIN----------------------------
#-----------------------------------------------------------

my $max = -99999;

my $score = Similarity($query,$subject);
if ($score > $max) {
    $max = $score;
    foreach my $x (Alignment($query,$subject)) 
    {	print "                 ",$x,"\n"; }
}
else { print " . "; } # just "." so you know the program is still runnning

exit 0;

#-----------------------------------------------------------
#------------------------SUBROUTINES------------------------
#-----------------------------------------------------------
sub Similarity 
{	# call &Similarity($seq1, $seq2)
	# Determines score of best alignment of strings $seq1 and $seq2
	# Score values are stored in @M
	# Returns max alignment score
	# Calls subroutines &ID and &MAX
	#. . . . . . . . . . . . . . . . .
    my($s,$t) = @_;  # sequences to be aligned.
    foreach my $i (0..length($s)) { $M[$i][0] = $g * $i; }
    foreach my $j (0..length($t)) { $M[0][$j] = $g * $j; }
	
    foreach my $i (1..length($s)) 
	{	foreach my $j (1..length($t)) 
		{	my $p =  ID(substr($s,$i-1,1),substr($t,$j-1,1));
			$M[$i][$j] = MAX($M[$i-1][$j] + $g, $M[$i][$j-1] + $g,$M[$i-1][$j-1] + $p);
		}
    }
    return ( $M[length($s)][length($t)] );
}
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
sub ID 
{  # call &ID(char1,char2)
    my ($aa1, $aa2) = @_;
    return ($aa1 eq $aa2)?$match:$mismatch; ## ternary operator. You dont have to use this.
}
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
sub MAX
{	# find max value
	# call MAX(default value, other values . . . )
	my ($m,@l) = @_;
    foreach my $x (@l) { $m = $x if ($x > $m); }
    return $m;
}
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
sub Alignment
{	# call &Alignment(seq1,seq2)
    my ($s,$t) = @_;  ## sequences to be aligned.
    my ($i,$j) = (length($s), length($t));
    return ( "-"x$j, $t) if ($i==0);
    return ( $s, "-"x$i) if ($j==0);
    my ($sLast,$tLast) = (substr($s,-1),substr($t,-1));
    
    if ($M[$i][$j] == $M[$i-1][$j-1] + ID($sLast,$tLast)) 
	{ ## Case 1: last letters are paired in the best alignment
		my ($sa, $ta) = Alignment(substr($s,0,-1), substr($t,0,-1));
		return ($sa . $sLast , $ta . $tLast );
    } 
	elsif ($M[$i][$j] == $M[$i-1][$j] + $g) 
	{ ## Case 2: last letter of the first string is paired with a gap
		my ($sa, $ta) = Alignment(substr($s,0,-1), $t);
		return ($sa . $sLast , $ta . "-");
    } 
	else 
	{ ## Case 3: last letter of the 2nd string is paired with a gap
		my ($sa, $ta) = Alignment($s, substr($t,0,-1));
		return ($sa . "-" , $ta . $tLast );
    }
}
