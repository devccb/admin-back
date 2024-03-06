{
  package Module;
  
  use Moo;

  with qw/Attribute::Name/;

  1;
}

use Test::More;

can_ok(
  Module->new,
  'name',
  'valid_name'
);

subtest 'Test using name true' => sub {
  my $name = 'Foo';

  my $module = Module->new(
    name => $name
  );

  ok($module->valid_name,  'Test if name is valid!');
  is($module->name, $name, 'Test if name is equal!');
};

subtest 'Test using name false' => sub {
  my $name = '';

  my $module = Module->new(
    name => $name
  );

  ok(!$module->valid_name, 'Test if name is not valid!');
  is($module->name, $name, 'Test if name is equal!');
};

subtest 'Test using name wrong' => sub {
  my $name = {};
  
  eval {
    my $module = Module->new(
      name => $name
    );
  };

  ok($@,              'Test if wrong name return an exception!');
  like($@, qr/"Str"/, 'Test if the error is a non-Str name!');
};

done_testing;
