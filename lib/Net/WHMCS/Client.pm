package Net::WHMCS::Client;

# ABSTRACT: WHMCS API Clients

use Moo;
with 'Net::WHMCS::Base';

use Carp 'croak';

sub getclientsdetails {
	my ($self, $params) = @_;
	$params->{action} = 'GetClientsDetails';
	return $self->build_request($params);
}

=pod

=head2 getclientsdetails

	$client->getclientsdetails({
		clientid => 1,
		stats => 'true',
	})

L<https://developers.whmcs.com/api-reference/getclientsdetails/>

=cut

sub addclient {
	my ($self, $params) = @_;
	$params->{action} = 'AddClient';
	return $self->build_request($params);
}

=pod

=head2 addclient

	$client->addclient({
		firstname => 'first',
		lastname => 'last',
		email => 'blabla@balbla.com',
		...
	})

L<https://developers.whmcs.com/api-reference/addclient/>

=cut

sub updateclient {
	my ($self, $params) = @_;
	$params->{action} = 'UpdateClient';
	return $self->build_request($params);
}

=pod

=head2 updateclient

	$client->updateclient({
		clientid => 1,
		firstname => 'first',
		lastname => 'last',
		email => 'blabla@balbla.com',
		...
	})

L<https://developers.whmcs.com/api-reference/updateclient/>

=cut

sub deleteclient {
	my ($self, $params) = @_;
	$params->{action} = 'DeleteClient';
	return $self->build_request($params);
}

=pod

=head2 deleteclient

	$client->deleteclient({
		clientid => 1
	})

L<https://developers.whmcs.com/api-reference/deleteclient/>

=cut

sub closeclient {
    my ( $self, $params ) = @_;
    $params->{action} = 'CloseClient';
    return $self->build_request($params);
}

=pod

=head2 closeclient

	$client->closeclient({
		clientid => 1
	});

L<https://developers.whmcs.com/api-reference/closeclient/>

=cut

sub addclientnote {
	my ( $self, $params ) = @_;
    $params->{action} = 'AddClientNote';
    return $self->build_request($params);
}

=pod

=head2 addclientnote

	$client->addclientnote({
		userid => 1,
		notes => 'Test Message'
	});

L<https://developers.whmcs.com/api-reference/addclientnote/>

=cut

sub getclients {
	my ($self, $params) = @_;
	$params ||= {};
	$params->{action} = 'GetClients';
	return $self->build_request($params);
}

=pod

=head2 getclients

	$client->getclients()

L<https://developers.whmcs.com/api-reference/getclients/>

=cut

sub getclientpassword {
	my ($self, $params) = @_;
	$params->{action} = 'GetClientPassword';
	return $self->build_request($params);
}

=pod

=head2 getclientpassword

	$client->getclientpassword({
		userid => 1
	})

L<https://developers.whmcs.com/api-reference/getclientpassword/>

=cut

sub getclientsproducts {
	my ($self, $params) = @_;
	$params ||= {};
	$params->{action} = 'GetClientsProducts';
	return $self->build_request($params);
}

=pod

=head2 getclientsproducts

	$client->getclientsproducts({
		clientid => 1
	})

L<https://developers.whmcs.com/api-reference/getclientsproducts/>

=cut

sub updateclientproduct {
	my ($self, $params) = @_;
	$params ||= {};
	$params->{action} = 'UpdateClientProduct';
	croak 'serviceid is required.' unless $params->{serviceid};
	return $self->build_request($params);
}

=pod

=head2 updateclientproduct

	$client->getclientsproducts({
		serviceid => 1,
		...
	});

L<https://developers.whmcs.com/api-reference/updateclientproduct/>

=cut

sub upgradeproduct {
	my ($self, $params) = @_;
	$params ||= {};
	$params->{action} = 'UpgradeProduct';
	foreach my $r (qw/clientid serviceid type newproductid newproductbillingcycle paymentmethod/) {
		croak "$r is required." unless $params->{$r};
	}
	return $self->build_request($params);
}

=pod

=head2 upgradeproduct

	$client->upgradeproduct({
		clientid => 1,
		serviceid => 1,
		type => 'product',
		newproductid => 18,
		newproductbillingcycle => 'monthly',
		paymentmethod => 'paypal'
	});

L<https://developers.whmcs.com/api-reference/upgradeproduct/>

=cut

sub validatelogin {
	my ($self, $params) = @_;
	$params ||= {};
	$params->{action} = 'ValidateLogin';
	croak 'email is required.' unless $params->{email};
	croak 'password2 is required' unless $params->{password2};
	return $self->build_request($params);
}

=pod

=head2 validatelogin

	$client->validatelogin({
		email => 'user@domain.com',
		password2 => 'abc123'
	});

L<https://developers.whmcs.com/api-reference/validatelogin/>

=cut


sub sendemail {
	my ($self, $params) = @_;
	$params ||= {};
	$params->{action} = 'SendEmail';
	return $self->build_request($params);
}

=pod

=head2 sendemail

	$client->sendemail({
		id => 1,
		messagename => 'blabla'
	})

L<https://developers.whmcs.com/api-reference/sendemail/>

=cut

1;