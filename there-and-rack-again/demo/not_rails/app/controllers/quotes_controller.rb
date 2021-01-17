require 'erubis'

class QuotesController
  def initialize(_env); end

  def render(view_name, locals = {})
    filename = File.join('app', 'views', 'quotes', "#{view_name}.html.erb")
    template = File.read(filename)
    eruby = Erubis::Eruby.new(template)
    eruby.result(locals)
  end

  def index
    render :index, quotes: ['I like ham', 'You like ham']
  end
end
