local async = require 'async'

async.json.connect({host='localhost', port=8483}, function(client)
   client.receive(function(res)
      print('response:',res)
   end)
   local int = async.setInterval(500,function()
      client.send({
         msg = 'my question:',
         attached = 'how are you?'
      })
   end)
   async.setTimeout(2100, function()
      client.close()
      int.clear()
   end)
end)

async.go()
