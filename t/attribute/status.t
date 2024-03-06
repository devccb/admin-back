{
  package Module;
  
  use Moo;

  with qw/Attribute::Status/;

  1;
}

use Test::More;

can_ok(
  Module->new,
  'status',
  'valid_status'
);

subtest 'Test using status true' => sub {
  my $status = int(rand(10));

  my $module = Module->new(
    status => $status
  );

  ok($module->valid_status,    'Test if status is valid!');
  is($module->status, $status, 'Test if status is equal!');
};

subtest 'Test using status false' => sub {
  my $status = int(rand(10)) + 10;

  my $module = Module->new(
    status => $status
  );

  ok(!$module->valid_status,   'Test if status is not valid!');
  is($module->status, $status, 'Test if status is equal!');
};

subtest 'Test using status wrong' => sub {
  my $status = '';
  
  eval {
    my $module = Module->new(
      status => $status
    );
  };

  ok($@,              'Test if wrong status return an exception!');
  like($@, qr/"Int"/, 'Test if the error is a non-Int status!');
};

done_testing;
