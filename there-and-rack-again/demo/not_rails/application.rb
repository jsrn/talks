module Rulers
  def self.to_underscore(string)
    string.gsub(/::/, '/')
          .gsub(/([A-Z]+)([A-Z][a-z])/, '\1_\2')
          .gsub(/([a-z\d])([A-Z])/, '\1_\2')
          .tr('-', '_')
          .downcase
  end
end

require './app/controllers/quotes_controller.rb'

class Application
  def call(env)
    klass, act = get_controller_and_action(env)
    controller = klass.new(env)

    text = controller.send(act)

    [200, { 'Content-Type' => 'text/html' }, [text]]
  end

  def get_controller_and_action(env)
    _, cont, action, _after = env['PATH_INFO'].split('/', 4)
    cont = cont.capitalize
    cont += 'Controller'

    [Object.const_get(cont), action]
  end
end
