require 'spec_helper'
require "savon"
require "soap_adapters/savon"

describe SoapAdapters::Savon do

  describe "attributes" do
    subject { described_class }
    it { is_expected.to have_attribute(:wsdl, String) }
    it { is_expected.to have_attribute(:logger) }
    it { is_expected.to have_attribute(:log).with_default(true) }
    it do
      is_expected.to have_attribute(:ssl_version, String).with_default(:TLSv1)
    end
    it { is_expected.to have_attribute(:last_request, String) }
  end

  describe "#call" do
    let(:client_args) do
      [
        :action,
        message: {
          unit_id: "unit_id",
        }
      ]
    end
    let(:client) { double(Savon::Client) }
    let(:built_request) { double(body: "request_xml") }
    let(:response) { double(to_s: "response_xml", xml: "response_xml") }
    let(:logger) { double }

    before do
      allow(::Savon).to receive(:client).with(hash_including(
        wsdl: "wsdl",
        logger: logger,
        log: true,
      )).and_return(client)
      allow(client).to receive(:build_request).with(*client_args).
        and_return(built_request)
      allow(client).to receive(:call).with(*client_args).
        and_return(response)
    end

    it "makes a soap call and sets the last request and response" do
      adapter = described_class.new(wsdl: "wsdl", logger: logger, log: true)
      r = adapter.call(*client_args)
      expect(adapter.last_request).to eq "request_xml"
      expect(r.to_s).to eq "response_xml"
      expect(r.xml).to eq "response_xml"
    end
  end

end
