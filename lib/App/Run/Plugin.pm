package API::Run::Plugin;
use Mojo::Base -base, -signatures;

sub load ($self, $app) {

  # it is plugin to load all routes
  $app->plugin('Route');

  # it is plugin to load all models
  $app->plugin('Model');
}

1;
