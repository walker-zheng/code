#! /usr/bin/perl -w

use strict;

sub get_test{
    my ($what, @array)=@_;
    printf "".("%D\t" x @array)."\n",@array;
}
sub sort_test {
    my %score = {
        "harry" => 234,
        "potter" => 224,
        "Larry" => 243,
        "Carmark" => 200,
        "RMS" => 200
       };
    
    my @names = sort {$score{$b} <=> $score{$a}} keys %score;
    ## not expect new unkown feature??? wtf
    ## printf "".("%d\t" x @names)."\n", @names;
    
    my @array = reverse sort {$b <=> $a} 0 .. 10; # reverse twice
    printf "".("%d " x @array)."\n", @array;
    

}

sub main_test{
    # &get_test("haha", 1, 2, 3, 4);
    &sort_test;
    
}
&main_test;
