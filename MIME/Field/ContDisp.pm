package MIME::Field::ContDisp;

=head1 NAME

MIME::Field::ContDisp - a "Content-disposition" field

=head1 DESCRIPTION

A subclass of Mail::Field.  

I<Don't use this class directly... its name may change in the future!>
Instead, ask Mail::Field for new instances based on the field name!


=head1 SYNOPSIS

    use Mail::Field;
    use MIME::Head;
    
    # Create an instance from some text:
    $field = Mail::Field->new('Content-disposition', $text);
    
    # Inline or attachment?
    $type = $field->type;    
    
    # Recommended filename?
    $filename = $field->filename;

=cut

require 5.001;
use strict;
use MIME::Field::ParamVal;
use vars qw($VERSION @ISA);

@ISA = qw(MIME::Field::ParamVal);

# The package version, both in 1.23 style *and* usable by MakeMaker:
( $VERSION ) = '$Revision: 1.2 $ ' =~ /\$Revision:\s+([^\s]+)/;

# Install it: 
bless([])->register('Content-disposition');

#------------------------------------------------------------

sub filename {
    my $value = shift->param('filename', @_);
    defined($value) ? $value : '';
}

sub type {
    my $value = shift->param('_', @_);
    defined($value) ? $value : '';
}

#------------------------------------------------------------
1;
