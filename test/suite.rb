require "cuba/test"
require "json"
require_relative "../app"

scope do
  def response_json
    JSON[last_response.body]
  end

  test "an OK comment" do
    post "/check", {content: "that is AWESOME!", ip: "127.0.0.1"}
    assert !response_json["is_spam"]
  end

  test "viagra spam" do
    post "/check", {content: "buy viagra now", ip: "127.0.0.1"}
    assert response_json["is_spam"]

    post "/check", {content: "buy ViaGra now", ip: "127.0.0.1"}
    assert response_json["is_spam"]
  end

  test "all caps" do
    post "/check", {content: "I AM YELLING!!!", ip: "127.0.0.1"}
    assert response_json["is_spam"]
  end

  test "the blacklisted ip 1.2.3.4" do
    post "/check", {content: "Yeah that was cool", ip: "1.2.3.4"}
    assert response_json["is_spam"]
  end

  test "it only responds to POSTs" do
    get "/check", {content: "Yeah that was cool", ip: "127.0.0.1"}
    assert_equal 404, last_response.status
  end
end
