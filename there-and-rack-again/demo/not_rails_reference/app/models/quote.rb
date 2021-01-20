class Quote
  DATA = [
    {
      text: 'Good API design requires that we make it easy to do the right thing and hard to do the wrong thing.',
      author: 'Kent C. Dodds (or maybe Kent Beck, I can never remember)'
    },
    {
      text: 'The bottom line on experience is this: if you work for 10 years, do you get 10 years of experience or do you get 1 year of experience 10 times?',
      author: 'Steve McConnell, Code Complete'
    }
  ]

  def initialize(attributes)
    @attributes = attributes
  end

  def [](attribute)
    @attributes[attribute.to_sym]
  end

  def self.all
    DATA.map { |quote_details| Quote.new(quote_details) }
  end
end
