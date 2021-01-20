require './application'
require './middleware/logger'

use Logger
run Application.new
