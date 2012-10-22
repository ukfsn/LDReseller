package LDReseller;
use Dancer ':syntax';
use Dancer::Plugin::DBIC 'schema';
use Dancer::Plugin::Auth::RBAC;
use Dancer::Plugin::FlashMessage;
use HTML::FormFu;

our $VERSION = '0.1';

hook 'before' => sub {
    my %noauth = ();
    map {$noauth{$_}++} qw{/ /login /signup};

    if (! session('user') && ! $noauth{request->path_info}) {
        var requested_path => request->path_info;
        request->path_info('/login');
    }
};

get '/' => sub {
    template 'index';
};

any ['get', 'post'] => '/login' => sub {
    my $form = _getform();
    if ( $form->submitted_and_valid ) {
        my $auth = auth($form->param_value('login'),
                        $form->param_value('password')
                        );
        if ( ! $auth->errors ) {
            redirect params->{'path'} || '/';
        }
        flash error => 'Login Invalid';
    }
    template 'login', { form => $form,
                        path => vars->{requested_path}
    };
};

get '/logout' => sub {
    session->destroy;
    redirect '/';
};

sub _getform {
    my $self = shift;
    my $p = shift || request->path;
    $p =~ s/\///;
    my $form = HTML::FormFu->new();
    $form->load_config_file(config->{forms}."$p.yml");
    my $params = params();
    $form->process($params);
    return $form;
}

true;
