require_relative '../lib/scrap_crypto.rb'

describe "the get_url method" do
  it "get url page for xpath" do
    expect(get_url.class).to eq(Nokogiri::HTML4::Document)
  end
end

describe "the get_name_crypto_in_array method" do
  it "pick up crypto symbols names and show it in an array" do
  expect(get_name_crypto_in_array(get_url())).to eq(["BTC", "ETH", "USDT", "BNB", "XRP", "USDC", "SOL", "ADA", "DOGE", "TRX", "TON", "DAI", "MATIC", "DOT", "LTC", "WBTC", "BCH", "SHIB", "LINK", "LEO"])
  end
end

