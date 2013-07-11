package Net::WHMCS::Base;

# ABSTRACT: WHMCS API Role

use Moo::Role;
use Carp 'croak';
use LWP::UserAgent;
use JSON;

has 'WHMCS_URL' => (is => 'rw', required => 1);
has 'WHMCS_USERNAME' => (is => 'rw', required => 1);
has 'WHMCS_PASSWORD' => (is => 'rw', required => 1);
has 'WHMCS_API_ACCESSKEY'  => (is => 'rw');

has 'ua' => (is => 'lazy');
sub _build_ua {
	return LWP::UserAgent->new;
}

sub build_request {
	my ($self, $params) = @_;

	if (not exists $params->{action}) {
		croak "No API action set\n";
	}

	$params->{username} = $self->WHMCS_USERNAME;
	$params->{password} = $self->WHMCS_PASSWORD;
	$params->{accesskey} = $self->WHMCS_API_ACCESSKEY if $self->WHMCS_API_ACCESSKEY;

	$params->{responsetype} = 'json';

	my $resp = $self->ua->post($self->WHMCS_URL, $params);
	return { result => 'error', message => $resp->status_line } unless $resp->is_success;

	print Dumper(\$resp); use Data::Dumper;

	return decode_json($resp->content);
}

=pod

=head3 build_request

	with 'Net::WHMCS::Base';

	$self->build_request({
		action => 'getclientsdetails',
		clientid => 1,
		stats => 'true',
	})

=cut

1;