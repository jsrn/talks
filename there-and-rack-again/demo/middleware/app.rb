class App
  def call(env)
    [
      200,
      { 'Content-Type' => 'text/html' },
      ["Hello, friends. I hope you're excited to throw off the shackles of DHH and write your own rack-based web frameworks."]
    ]
  end
end
