module SoapAdapters
  class Savon

    include Virtus.model
    CLIENT_ATTRS = %i[wsdl logger log ssl_version]

    attribute :wsdl, String
    attribute :logger
    attribute :log, Boolean, default: true
    attribute :ssl_version, Symbol, default: :TLSv1
    attribute :last_request, String

    def ssl_version
      @ssl_version || :TLSv1
    end

    def call(*args)
      result = client.call(*args)
      self.last_request = client.build_request(*args).body
      result
    end

    private

    def client
      args = CLIENT_ATTRS.reduce({}) do |hash, attr|
        val = self.attributes.fetch(attr)
        hash[attr] = val unless val.nil?
        hash
      end
      ::Savon.client(args)
    end

  end
end
