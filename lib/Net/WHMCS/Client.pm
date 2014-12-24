package Net::WHMCS::Client;

# ABSTRACT: WHMCS API Clients

use Moo;
with 'Net::WHMCS::Base';

use Carp 'croak';

sub getclientsdetails {
	my ($self, $params) = @_;
	$params->{action} = 'getclientsdetails';
	return $self->build_request($params);
}

=pod

=head2 getclientsdetails

	$client->getclientsdetails({
		clientid => 1,
		stats => 'true',
	})

L<http://docs.whmcs.com/API:Get_Clients_Details>

=cut

sub addclient {
	my ($self, $params) = @_;
	$params->{action} = 'addclient';
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

L<http://docs.whmcs.com/API:Add_Client>

=cut

sub updateclient {
	my ($self, $params) = @_;
	$params->{action} = 'updateclient';
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

L<http://docs.whmcs.com/API:Update_Client>

=cut

sub deleteclient {
	my ($self, $params) = @_;
	$params->{action} = 'deleteclient';
	return $self->build_request($params);
}

=pod

=head2 deleteclient

	$client->deleteclient({
		clientid => 1
	})

L<http://docs.whmcs.com/API:Delete_Client>

=cut

sub closeclient {
    my ( $self, $params ) = @_;
    $params->{action} = 'closeclient';
    return $self->build_request($params);
}

=pod

=head2 closeclient

	$client->closeclient({
		clientid => 1
	});

L<http://docs.whmcs.com/API:Close_Client>

=cut

sub addclientnote {
	my ( $self, $params ) = @_;
    $params->{action} = 'addclientnote';
    return $self->build_request($params);
}

=pod

=head2 addclientnote

	$client->addclientnote({
		userid => 1,
		notes => 'Test Message'
	});

L<http://docs.whmcs.com/API:Add_Client_Note>

=cut

sub getclients {
	my ($self, $params) = @_;
	$params ||= {};
	$params->{action} = 'getclients';
	return $self->build_request($params);
}

=pod

=head2 getclients

	$client->getclients()

L<http://docs.whmcs.com/API:Get_Clients>

=cut

sub getclientpassword {
	my ($self, $params) = @_;
	$params->{action} = 'getclientpassword';
	return $self->build_request($params);
}

=pod

=head2 getclientpassword

	$client->getclientpassword({
		userid => 1
	})

L<http://docs.whmcs.com/API:Get_Clients_Password>

=cut

sub getclientsproducts {
	my ($self, $params) = @_;
	$params ||= {};
	$params->{action} = 'getclientsproducts';
	return $self->build_request($params);
}

=pod

=head2 getclientsproducts

	$client->getclientsproducts({
		clientid => 1
	})

L<http://docs.whmcs.com/API:Get_Clients_Products>

=cut

sub updateclientproduct {
	my ($self, $params) = @_;
	$params ||= {};
	$params->{action} = 'updateclientproduct';
	croak 'serviceid is required.' unless $params->{serviceid};
	return $self->build_request($params);
}

=pod

=head2 updateclientproduct

	$client->getclientsproducts({
		serviceid => 1,
		...
	});

L<http://docs.whmcs.com/API:Update_Client_Product>

=cut

sub upgradeproduct {
	my ($self, $params) = @_;
	$params ||= {};
	$params->{action} = 'upgradeproduct';
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

L<http://docs.whmcs.com/API:Upgrade_Product>

=cut

sub validatelogin {
	my ($self, $params) = @_;
	$params ||= {};
	$params->{action} = 'validatelogin';
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

L<http://docs.whmcs.com/API:Validate_Login>

=cut


sub sendemail {
	my ($self, $params) = @_;
	$params ||= {};
	$params->{action} = 'sendemail';
	return $self->build_request($params);
}

=pod

=head2 sendemail

	$client->sendemail({
		id => 1,
		messagename => 'blabla'
	})

L<http://docs.whmcs.com/API:Send_Email>

=cut

1;