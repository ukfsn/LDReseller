package LDReseller;
use Dancer ':syntax';
use Dancer::Plugin::DBIC 'schema';
use Dancer::Plugin::Auth::RBAC;
use Dancer::Plugin::FlashMessage;

use LDReseller::Admin;

our $VERSION = '0.1';

hook 'before' => sub {
    my %noauth = ();
    map {$noauth{$_}++} qw{/ /login /logout};

    if (! session('user') && ! $noauth{request->path_info}) {
        var requested_path => request->path_info;
        request->path_info('/login');
    }
};

get '/' => sub {
    template 'index';
};

get '/login' => sub {
    template 'login', { path => vars->{requested_path} };
};

post '/login' => sub {
    if ( ! params->{login} || ! params->{password} ) {
        return template 'login', {path => vars->{requested_path}};
    }
    my $auth = auth(params->{login}, params->{password});
    if ( $auth->errors ) {
        flash error => "Login failed";
        return template 'login', { path => vars->{requested_path} };
    }
    redirect params->{path} || '/';
};

get '/logout' => sub {
    session->destroy;
    redirect '/';
}

true;
