package MooseX::VerboseConstraints;

our $VERSION = '0.01';

use warnings;
use strict;
use Moose;
use Devel::PartialDump qw(dump);

{
no warnings 'redefine';
sub Moose::Meta::TypeConstraint::get_message {
    my ($self, $value) = @_;
    if (my $msg = $self->message) {
        local $_ = $value;
        return $msg->($value);
    }
    else {
        return "Validation failed for '" . $self->name . "' failed with value ".dump($value);
    }
};
}

1;
__END__
=head1 NAME

MooseX::VerboseConstraints - The great new MooseX::VerboseConstraints!

=head1 VERSION

Version 0.01

=head1 SYNOPSIS

    perl -MMooseX::VerboseConstraints script.pl

Make the Moose type constraint failures include more information.

=head1 AUTHOR

Pawel Murias, C<< <pawelmurias at gmail.com> >>

=head1 BUGS

Please report any bugs or feature requests to C<bug-moosex-verboseconstraints at rt.cpan.org>, or through
the web interface at L<http://rt.cpan.org/NoAuth/ReportBug.html?Queue=MooseX-VerboseConstraints>.  I will be notified, and then you'll
automatically be notified of progress on your bug as I make changes.




=head1 SUPPORT

You can find documentation for this module with the perldoc command.

    perldoc MooseX::VerboseConstraints


You can also look for information at:

=over 4

=item * RT: CPAN's request tracker

L<http://rt.cpan.org/NoAuth/Bugs.html?Dist=MooseX-VerboseConstraints>

=item * AnnoCPAN: Annotated CPAN documentation

L<http://annocpan.org/dist/MooseX-VerboseConstraints>

=item * CPAN Ratings

L<http://cpanratings.perl.org/d/MooseX-VerboseConstraints>

=item * Search CPAN

L<http://search.cpan.org/dist/MooseX-VerboseConstraints/>

=back


=head1 ACKNOWLEDGEMENTS


=head1 LICENSE AND COPYRIGHT

Copyright 2010 Pawel Murias.

This program is free software; you can redistribute it and/or modify it
under the terms of either: the GNU General Public License as published
by the Free Software Foundation; or the Artistic License.

See http://dev.perl.org/licenses/ for more information.


=cut

1; # End of MooseX::VerboseConstraints
