class Logger
  def initialize(app)
    @app = app
  end

  def call(env)
    status, headers, body = @app.call(env)
  ensure
    write_line(env['REMOTE_ADDR'], env['REQUEST_PATH'], status || 500)
    [status, headers, body]
  end

  private

  def write_line(source_ip, path, response_code)
    File.open('log/access.log', 'ab') do |file|
      file.write("#{source_ip}\t#{path}\t#{response_code}\n")
    end
  end
end
