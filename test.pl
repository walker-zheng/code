#! /usr/bin/perl -w

use strict;

sub get_test{
    my ($what, @array)=@_;
    printf "".("%D\t" x @array)."\n",@array;
}


sub main_test{
    &get_test("haha", 1, 2, 3, 4);
    
}
&main_test;
