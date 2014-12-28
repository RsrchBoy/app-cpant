package App::cpant::Command::short;

use strict;
use warnings;
use autobox::Core;

use App::cpant -command;

#use Class::Load 'load_class';

# debugging...
use Smart::Comments '###';

use aliased 'CPAN::Testers::WWW::Reports::Query::AJAX' => 'TestersQuery';

sub opt_spec { return () }
sub validate_args {}

sub execute {
    my ($self, $opt, $args) = @_;


    ### $opt
    ### $args

    my $query = TestersQuery->new(
        dist => $args->shift,
        format => 'csv',
    );

    ### raw: $query->raw
    ### data: $query->data
    return;
}

no Class::Load;

!!42;

__END__

#!/usr/bin/perl -w
use strict;

use lib qw(lib);

use Data::Dumper;
use CPAN::Testers::WWW::Reports::Query::AJAX;

# various argument sets for examples

my @args = (
    {
        dist    => 'App-Maisha',
        version => '0.15',  # optional, will default to latest version
        format  => 'txt'
    },
    {
        dist    => 'App-Maisha',
        version => '0.15',  # optional, will default to latest version
        format  => 'xml'
    },
    {
        dist    => 'App-Maisha',
        version => '0.15',  # optional, will default to latest version
        format  => 'html'
    },
    {
        dist    => 'App-Maisha',
        version => '0.15',  # optional, will default to latest version
        # default format = xml
    },
    {
        dist    => 'App-Maisha',
        format  => 'txt'
    },
    {
        dist    => 'App-Maisha',
        format  => 'xml'
    },
    {
        dist    => 'App-Maisha',
        format  => 'html'
    },
    {
        dist    => 'App-Maisha',
        # default format = xml
    }
);

my $query = CPAN::Testers::WWW::Reports::Query::AJAX->new( %{ $args[0] } );

exit    unless($query);

my $raw  = $query->raw();
my $data = $query->data();

print Dumper($raw);
print Dumper($data);
