{
  package Module;
  
  use Moo;

  with qw/Attribute::Id/;

  1;
}

use Test::More;

can_ok(
  Module->new,
  'id',
  'valid_id'
);

subtest 'Test using id true' => sub {
  my $id = int(rand(9999999));

  my $module = Module->new(
    id => $id
  );

  ok($module->valid_id, 'Test if id is valid!');
  is($module->id, $id,  'Test if id is equal!');
};

subtest 'Test using id false' => sub {
  my $id = 0;
  
  my $module = Module->new(
    id => $id
  );

  ok(!$module->valid_id, 'Test if id is not valid!');
  is($module->id, $id,   'Test if id is equal!');
};

subtest 'Test using id wrong' => sub {
  my $id = '';
  
  eval {
    my $module = Module->new(
      id => $id
    );
  };

  ok($@,              'Test if wrong id return an exception!');
  like($@, qr/"Int"/, 'Test if the error is a non-Int id!');
};

done_testing;