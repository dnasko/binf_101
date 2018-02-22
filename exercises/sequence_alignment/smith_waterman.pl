#!/usr/bin/perl -w
use strict;

## Usage: ./smith_waterman.pl ATGCATGCACGTACGT AGCCGGT

my $seq1 = $ARGV[0];
my $seq2 = $ARGV[1];

my $ALL_maxscore = 0;

# scoring scheme
my $MATCH    =  2; # +1 for letters that match
my $MISMATCH = -0.5; # -1 for letters that mismatch
my $GAP      = -1; # -1 for any gap

## Initialize
my @matrix;
$matrix[0][0]{score}   = 0;
$matrix[0][0]{pointer} = "none";
for(my $j = 1; $j <= length($seq1); $j++) {
    $matrix[0][$j]{score}   = 0;
    $matrix[0][$j]{pointer} = "none";
}
for (my $i = 1; $i <= length($seq2); $i++) {
    $matrix[$i][0]{score}   = 0;
    $matrix[$i][0]{pointer} = "none";
}
    
## Fill
my $max_i     = 0;
my $max_j     = 0;
my $max_score = 0;

for(my $i = 1; $i <= length($seq2); $i++) {
    for(my $j = 1; $j <= length($seq1); $j++) {
	my ($diagonal_score, $left_score, $up_score);
	
	# calculate match score
	my $letter1 = substr($seq1, $j-1, 1);
	my $letter2 = substr($seq2, $i-1, 1);       
	if ($letter1 eq $letter2) {
	    $diagonal_score = $matrix[$i-1][$j-1]{score} + $MATCH;
	}
	else {
	    $diagonal_score = $matrix[$i-1][$j-1]{score} + $MISMATCH;
	}
	
	# calculate gap scores
	$up_score   = $matrix[$i-1][$j]{score} + $GAP;
	$left_score = $matrix[$i][$j-1]{score} + $GAP;
	
	if ($diagonal_score <= 0 and $up_score <= 0 and $left_score <= 0) {
	    $matrix[$i][$j]{score}   = 0;
	    $matrix[$i][$j]{pointer} = "none";
	    next; # terminate this iteration of the loop
	}
	
	# choose best score
	if ($diagonal_score >= $up_score) {
	    if ($diagonal_score >= $left_score) {
		$matrix[$i][$j]{score}   = $diagonal_score;
		$matrix[$i][$j]{pointer} = "diagonal";
	    }
	    else {
		$matrix[$i][$j]{score}   = $left_score;
		$matrix[$i][$j]{pointer} = "left";
	    }
	} else {
	    if ($up_score >= $left_score) {
		$matrix[$i][$j]{score}   = $up_score;
		$matrix[$i][$j]{pointer} = "up";
	    }
	    else {
		$matrix[$i][$j]{score}   = $left_score;
		$matrix[$i][$j]{pointer} = "left";
	    }
	}
	
	# set maximum score
	if ($matrix[$i][$j]{score} > $max_score) {
	    $max_i     = $i;
	    $max_j     = $j;
	    $max_score = $matrix[$i][$j]{score};
	}
    }
}

## Trace-back
    
my $align1 = "";
my $align2 = "";

my $j = $max_j;
my $i = $max_i;

while (1) {
    last if $matrix[$i][$j]{pointer} eq "none";
    
    if ($matrix[$i][$j]{pointer} eq "diagonal") {
	$align1 .= substr($seq1, $j-1, 1);
	$align2 .= substr($seq2, $i-1, 1);
	$i--; $j--;
    }
    elsif ($matrix[$i][$j]{pointer} eq "left") {
	$align1 .= substr($seq1, $j-1, 1);
	$align2 .= "-";
	$j--;
    }
    elsif ($matrix[$i][$j]{pointer} eq "up") {
	$align1 .= "-";
	$align2 .= substr($seq2, $i-1, 1);
	$i--;
    }   
}

## need to reverse the alignemnts because we did them in the reverse through the matrix 
$align1 = reverse $align1;
$align2 = reverse $align2;

my $middle_bit = get_middle_bit($align1, $align2);

if ($max_score >= $ALL_maxscore)
{   $ALL_maxscore = $max_score;
    print "\n\n";
    print "Seq1:\t$align1\n";
    print "     \t$middle_bit\n";
    print "Seq2:\t$align2\n";
    print "Score: $max_score\n\n";
}

exit 0;

sub get_middle_bit
{
    my $s1 = $_[0];
    my $s2 = $_[1];
    my $middle = "";
    for (my $i=0; $i<length($s1); $i++) {
	my $b1 = substr $s1, $i, 1;
	my $b2 = substr	$s2, $i, 1;
	if ($b1 eq $b2) { $middle = $middle . $b1; }
	else { $middle = $middle . " "; }
    }
    return $middle;
}
