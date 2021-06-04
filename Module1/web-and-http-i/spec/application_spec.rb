require './spec_helper'
require '../lib/application'

describe Application do
  let(:app) { Application.new }
  let(:env) { { "REQUEST_METHOD" => "GET", "PATH_INFO" => "/" } }
  let(:res) { app.call(env) }
  let(:status) { res[0] }
  let(:headers) { res[1] }
  let(:body) { res[2] }

  context "It implements Racks interface" do
    describe "#call" do
      it "is implemented" do
        expect { app.call(env) }.not_to(raise_error { NoMethodError })
      end

      it "returns an array of 3 elements" do
        expect(res.size).to eql 3
      end

      it "the elements have the right data type " do
        expect(status).to be_a Integer
        expect(headers).to be_a Hash
        expect(body).to be_a Array
      end

      it "responds with 200" do
        expect(status).to eql 200
      end

      it "" do
        expect(headers).to include("Content-type" => "text/html")
      end

      it "" do
        cat_video = body[0]

        expect(cat_video).to include("imgur")
      end
    end
  end
end
