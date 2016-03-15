package any;
use 5.008001;
use strict;
use warnings;

our $VERSION = "0.01";

sub import {
    my ($class, $name, @modules) = @_;
    my $caller = caller;
    for my $module (@modules) {
        my $success = eval sprintf q{
            package %s;
            use %s;
            1;
        }, $caller, $module;
        if ($success) {
            no strict qw/refs/;
            *{"${caller}::${name}"} = sub () { $module };
            return;
        }
    }
    die $@;
}

1;
__END__

=encoding utf-8

=head1 NAME

any - It's new $module

=head1 SYNOPSIS

    use any JSON => qw/JSON::XS JSON::PP/;

    JSON->new->utf8->encode({});

=head1 DESCRIPTION

any is ...

=head1 LICENSE

Copyright (C) karupanerura.

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=head1 AUTHOR

karupanerura E<lt>karupa@cpan.orgE<gt>

=cut

