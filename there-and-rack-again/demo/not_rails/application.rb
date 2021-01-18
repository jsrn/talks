require './app/controllers/quotes_controller.rb'

class Router
  def self.controller_and_action(env)
    _, cont, action, _after = env['PATH_INFO'].split('/', 4)
    cont = cont.capitalize
    cont += 'Controller'

    [Object.const_get(cont), action]
  end
end

class Application
  def call(env)
    controller_class, action = Router.controller_and_action(env)

    controller = controller_class.new(env)
    response_body = controller.send(action)

    [200, { 'Content-Type' => 'text/html' }, [response_body]]
  end
end
