class WelcomeController < ApplicationController

  def index
    render text: "This is a test SAML IdP server."
  end

end