package Module::Regional;

use Moo;

with qw/
  Attribute::Id
  Attribute::Name
  Attribute::Status
/;

sub add {
  my $self = shift;

  return unless $self->name;
  return unless $self->status;

  return 1;
}

1;
