package Net::WHMCS::Miscellaneous;

# ABSTRACT: WHMCS API Miscellaneous

use Moo;
with 'Net::WHMCS::Base';

use Carp 'croak';

sub addproduct {
	my ($self, $params) = @_;
	$params->{action} = 'AddProduct';
	foreach my $r (qw/gid name/) {
		croak "$r is required." unless $params->{$r};
	}
	return $self->build_request($params);
}

=pod

=head2 addproduct

	$whmcs->misc->addproduct({
		type => 'other',
		gid => 1,
		name => 'Sample Product',
		paytype => 'recurring',
		'pricing[1][monthly]' => '5.00',
		'pricing[1][annually]' => '50.00',
		...
	});

L<https://developers.whmcs.com/api-reference/addproduct/>

=cut

1;