package Attribute::Name;

use Moo::Role;
use Types::Standard qw/ Str /;
use namespace::autoclean;

# attribute name
has 'name' => (
  is  => 'ro',
  isa => Str
);

# lazy to valid attribute name
has 'valid_name' => (
  is => 'lazy'
);

# valid attribute name
sub _build_valid_name {
  my $self = shift;

  return unless $self->name !~ /^$/;
  return 1;
}

1;