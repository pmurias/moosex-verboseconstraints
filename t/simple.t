#!/usr/bin/perl
use MooseX::VerboseConstraints;
use strict;
use warnings;
use Test::More;

{
    package MooseX::VerboseConstraints::Test;
    use Moose;
    has 'foo' => (is=>'ro',isa=>'ArrayRef[Int]');
};

my $obj = MooseX::VerboseConstraints::Test->new(foo=>[12,45]);
isa_ok $obj,"MooseX::VerboseConstraints::Test","created an object by passing a valid attribute value";
eval {
    MooseX::VerboseConstraints::Test->new(foo=>[12,"hi"]);
};
like $@,qr/\[ 12, "hi" \]/,"Devel::PartialDump is used to dump the argument"; 
done_testing;

