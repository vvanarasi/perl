#########################################################################################################
#													                                                                              #	
# PROGRAM NAME : TestUserPwd.pl										                                                      #
# AUTHOR       : Vanarasi										                                                            #
# DATE         : 11/30/2014										                                                          #
# PURPOSE      : Perl script to accept username and password and authorize based on master user list	  #
#											  		                                                                            #
#											  		                                                                            #
# HISTORY:												                                                                      #
#													                                                                              #
#     11/30/2014  Vanarasi  Initial revision				  				                                          #
#											  		                                                                            #
#											  		                                                                            #
#########################################################################################################

use strict;                                                                            
use warnings;                                                                                                               

use IO::Prompter;
use Data::Dumper;
use Pod::Usage;
use Getopt::Long;

### Variables declaration
my $username;
my $password;
my $usage;
my @user_master_list;

my $result = GetOptions(
                        "h|help"            => \$usage
                       );
pod2usage(1) if $usage;
 
$username = prompt 'Enter User Name:'; 
$password = prompt 'Enter your password', -echo=>'*';

## Remove New line characters 
chomp ($username);
chomp ($password);

## Trim white spaces 
$username =~ s/^\s+//;
$username =~ s/\s+$//;

$password =~ s/^\s+//;
$password =~ s/\s+$//;

sub read_master_list {

	open(my $fh, "<user_master_list.txt") or die "Couldn't open file user_master_list.txt, $!";
	while(<$fh>) { 
	    chomp; 
	    push @user_master_list , $_;
	}
	close $fh;
}

sub validate_user {

	if ($username eq "") {
	    print "\n";
	    print "Undefined UserName!!\n";	
	    exit 1;
	}

	if (grep /$username/, @user_master_list) {
	    print "---------------------------\n";
	    print "\n";
	    print "User Authorized!!"."\n";
	    print "\n";
	    print "---------------------------\n";

	}
	else {
	    print "---------------------------\n";
	    print "\n";
	    print "User Not Authorized!!"."\n";
	    print "\n";
	    print "---------------------------\n";
	}
}

read_master_list();
validate_user();

__END__

=head1 NAME

TestUserPwd.pl - To accept username and password and Authorize user based on master user list 

=head1 SYNOPSIS

TestUserPwd.pl [-help] 
    
    To accept username and password and Authorize user based on master user list. 
    Prompts for Username and Password on Execution.
    Options:

    -h|-help           Show this cruft

=head1 OPTIONS

=over 8

=item B<-help>

    Prints a help message and exits.

=back

=head1 DESCRIPTION

B<TestUserPwd.pl> To accept username and password and Authorize user based on master user list.

=cut
