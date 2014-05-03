require "cuba"
require "json"

Cuba.define do
  on default do
    res.write 'make everything pass'
  end
end
