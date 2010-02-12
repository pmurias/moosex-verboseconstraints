#!perl -T

use Test::More tests => 1;

BEGIN {
    use_ok( 'MooseX::VerboseConstraints' ) || print "Bail out!
";
}

diag( "Testing MooseX::VerboseConstraints $MooseX::VerboseConstraints::VERSION, Perl $], $^X" );
