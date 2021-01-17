class AngryMiddleware
  def initialize(app)
    @app = app
  end

  def call(env)
    status, headers, body = @app.call(env)
    [status, headers, shouted(body)]
  end

  private

  def shouted(body)
    [%(<strong style="font-size: 36px; line-height: 1.5;">
      #{body.join.upcase.chars.join('&nbsp;')}
    </strong>)]
  end
end
