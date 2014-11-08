use strict; use warnings;
use Plack;
use Plack::Request;

my $var = 'default';

sub {
    my $env = shift;
    my $req = Plack::Request->new($env);
    my $query = $req->param('query');

    $var = $query if $query;

    my $res = $req->new_response(200); 
    $res->content_type('text/plain');
    $res->body($var);

    $res->finalize;
}
