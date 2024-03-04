package App::Run::Helper;
use Mojo::Base -base, -signatures;

use Mojo::mysql;
use SQL::Load;
use Data::Dump;

sub load ($self, $app) {

  # set database configuration
  my $database = $app->config->{databases}->{$app->environment};
  $app->helper(
    mysql => sub {
      state $mysql = Mojo::mysql->new(
        dsn      => 'dbi:mysql:host=' . $database->{host} . ';database=' . $database->{base},
        username => $database->{user},
        password => $database->{pass}
      );
    }
  );

  # set sql load
  $app->helper(
    sql => sub {
      state $sql = SQL::Load->new($app->home . '/lib/App/SQL', "\n");
    }
  ); 

  # set helper method
  $app->helper(
    method => sub {
      state $method = App::Helper::Method->new(app => $app);
    }
  );   

  # set helper dump
  $app->helper(
    dump => sub ($c, $data) {
      return Data::Dump::dump($data)
    }
  );   
}

1;
