local navigate = require('notebase.navigate')

describe("greeting", function()
   it('works!', function()
      assert.combinators.match("Hello Gabo", navigate.greeting("Gabo"))
   end)
end)

