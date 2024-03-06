package Attribute::Id;

use Moo::Role;
use Types::Standard qw/ Int /;
use namespace::autoclean;

# attribute id
has 'id' => (
  is  => 'ro',
  isa => Int
);

# lazy to valid attribute id
has 'valid_id' => (
  is => 'lazy'
);

# valid attribute id
sub _build_valid_id {
  my $self = shift;

  return unless $self->id > 0;
  return 1;
}

1;
