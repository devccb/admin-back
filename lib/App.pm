package App;
use Mojo::Base 'Mojolicious', -signatures;
use API::Run::Plugin;

# This method will run once at server start
sub startup ($self) {

  # it is module to load all plugins
  API::Run::Plugin->load($self);

  # set file log
  $self->log->path($self->home . '/log/mojo.log') if -d $self->home . '/log';  
}

1;
