#!/usr/bin/perl -w
use warnings;
use strict;

my %ir_hash_1 = ();
my %ir_hash_2 = ();

sub parse
{
my $filename = $_[0];
my $ir_hash = $_[1];

my $ir_all = 0;
my $ir_count = 0;
my $func_name = "";
my $count_header = 0;
my $ready = 0;

open (INPUTFILE, $filename) || die ("could not open file"); 

while(<INPUTFILE>)
{
    if (/^([\d\,]+) +PROGRAM TOTALS/)
    {
        $ir_all = $1;
        $ir_all =~ s/,//g;
        #printf("%d\n",$ir_all);
    }
    if (/--------------------------------------------------------------------------------/)
    {
        $count_header++;
        if ($count_header == 6)
        {
            $ready = 1;
        }
    }
    if ($ready == 0)
    {
        next;
    }
    chomp();
    if (/^ *([\d\,]+) +(.*)$/)
    {
        $ir_count = $1;
        $func_name = $2;
        $ir_count =~ s/,//g;
        #printf("XXX: %d %s\n", $ir_count, $func_name);
        $ir_hash->{$func_name} = $ir_count*100.0/$ir_all;
    }
}

close INPUTFILE;

}

my $filename1 = $ARGV[0];
my $filename2 = $ARGV[1];
my $min = $ARGV[2];

&parse("out_annotate_1.tmp", \%ir_hash_1);
&parse("out_annotate_2.tmp", \%ir_hash_2);

foreach my $key (keys %ir_hash_2)
{
    my $value1 = $ir_hash_1{$key};
    my $value2 = $ir_hash_2{$key};
    if (not defined $value1)
    {
        $value1 = 0;
    }
    my $diff = $value2 - $value1;
    if ($diff >= $min || $diff <= -1*$min)
    {
        #TODO: print by order
        if ($diff > 0)
        {
            printf("+");
        }
        printf("%.2f%% %.2f%% %.2f%% %s\n", $value2-$value1, $value1, $value2, $key);
    }
}

