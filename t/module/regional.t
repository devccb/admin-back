use Test::More;

use_ok('Module::Regional');

can_ok(
  Module::Regional->new,
  # attributes
  'id',
  'name',
  'status',
  'valid_id',
  'valid_name',
  'valid_status',

  # methods
  'add'
);

subtest 'Test for add!' => sub {
  my $module = Module::Regional->new(
    name   => 'Foo',
    status => 1
  );

  ok($module->add, 'Test if attributes are valid!');
};

done_testing;
