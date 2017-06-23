use strict;
use warnings;

use String::Random;

my $pass = new String::Random;
print "\n";
print "Your password generated using Random Module ", $pass->randpattern("Cc!cc!nncn"), "\n";
print "\n";
print "------------------------------------------------------------\n";
print "\n";
my @chars = ('0'..'9', 'A'..'Z' , 'a' .. 'z','$','@','_','-','!');
my $len = 9;
my $string;
while($len--){ $string .= $chars[rand @chars] };
print "Your password generated with out using any perl module ",  "$string\n";