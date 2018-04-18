module Lita
  module Handlers
    class Doubler < Handler
      # START:route
      route(
        # "lita double 4"
        /^double\s+(\d+)$/i,
        :respond_with_double,

        # only respond when addressed by name
        command: true,

        # hints displayed when user types "lita help"
        help: { 'double N' => 'prints N + N' }
      )
      # END:route

      # START:handler
      def respond_with_double(response)
        # Read up on the Ruby MatchData class for more options
        n = response.match_data.captures.first
        n = Integer(n)

        response.reply "#{n} + #{n} = #{double_number n}"
      end
      # END:handler

      # START:doubler_method
      def double_number(n)
        n + n
      end
      # END:doubler_method

      Lita.register_handler(self)
    end
  end
end
