package Net::WHMCS::Miscellaneous;

# ABSTRACT: WHMCS API Miscellaneous

use Moo;
with 'Net::WHMCS::Base';

use Carp 'croak';

sub addproduct {
	my ($self, $params) = @_;
	$params->{action} = 'addproduct';
	foreach my $r (qw/type gid name paytype/) {
		croak "$r is required." unless $params->{$r};
	}
	return $self->build_request($params);
}

=pod

=head2 addproduct

	$client->addproduct({
		type => 'other',
		gid => 1,
		name => 'Sample Product',
		paytype => 'recurring',
		'pricing[1][monthly]' => '5.00',
		'pricing[1][annually]' => '50.00',
		...
	});

L<http://docs.whmcs.com/API:Add_Product>

=cut

1;