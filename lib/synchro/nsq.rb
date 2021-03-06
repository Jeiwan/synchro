module Synchro
  class NSQ
    def initialize(sender: '', host: 'localhost', port: 4150, topic: 'current_pharmacy')
      @host, @port, @topic, @sender_model = host, port, topic, sender
    end

    def post_message(message)
      producer = Krakow::Producer.new(
        host: @host,
        port: @port,
        topic: @topic
      )
      json_message = JSON.generate({
        model: @sender_model,
        message: message
      })
      producer.write(json_message)
      producer.terminate
    end
  end
end
