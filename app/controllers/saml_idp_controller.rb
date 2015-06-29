class SamlIdpController < SamlIdp::IdpController

  def idp_authenticate(enterprise_id, email, first_name, last_name, is_employee)
    {
      enterprise_id: enterprise_id,
      email: email,
      first_name: first_name,
      last_name: last_name,
      is_employee: is_employee
    }
  end

  def idp_make_saml_response(attributes_hash)
    encode_SAMLResponse attributes_hash[:enterprise_id], attributes_provider: saml_attributes_builder(attributes_hash)
  end

  def saml_attributes_builder(attribute_hash)
    response = '<saml:AttributeStatement>'
    attribute_hash.each do |name, value|
      response << %Q[<saml:Attribute Name="#{name}"><saml:AttributeValue>#{value}</saml:AttributeValue></saml:Attribute>]
    end
    response << '</saml:AttributeStatement>'
    response
  end

end
