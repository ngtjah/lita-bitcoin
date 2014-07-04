require "lita"

module Lita
  module Handlers
    class Bitcoin < Handler

      URL = "https://api.bitcoinaverage.com/ticker/global/USD/last"

      route(/btc/i, :reply, command: true, help: {
        "btc" => "Returns the current BTC/USD exchange rate."
      })

      def self.default_config(handler_config)
      end

      def reply(response)
        response.reply "1 BTC is currently worth #{rate}"
      end

      private

      def rate
        http.get(URL).body
      end

    end

    Lita.register_handler(Bitcoin)
  end
end
