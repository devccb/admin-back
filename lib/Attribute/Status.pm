package Attribute::Status;

use Moo::Role;
use Types::Standard qw/ Int /;
use namespace::autoclean;

# attribute status
has 'status' => (
  is  => 'ro',
  isa => Int
);

# lazy to valid attribute status
has 'valid_status' => (
  is => 'lazy'
);

# valid attribute status
sub _build_valid_status {
  my $self = shift;

  return unless $self->status =~ /^\d{1}$/;
  return 1;
}

1;
