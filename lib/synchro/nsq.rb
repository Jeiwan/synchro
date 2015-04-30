module Synchro
  class NSQ
    def initialize(host = 'localhost', port = 4150, topic = 'current_pharmacy')
      @host, @port, @topic = host, port, topic
    end

    def post_message(message)
      producer = Krakow::Producer.new(
        host: @host,
        port: @port,
        topic: @topic
      )
      json_message = JSON.generate({ message: message })
      producer.write(json_message)
    end
  end
end
