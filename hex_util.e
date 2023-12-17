class HEX_UTIL

feature {ANY}
   hu_parse (s: STRING)
      local
         i: INTEGER; c: CHARACTER; bad_char: BOOLEAN
      do
         hu_parsed := 128
         hu_integer_64 := 0
         hu_integer_32 := 0
         hu_integer_16 := 0
         hu_integer_8 := 0
         if s.has_prefix(once "0x") or s.has_prefix(once "0X") then
            s.remove_head(2)
         end

         if not s.is_empty then
            from
               i := s.lower
            until
               i > s.upper or bad_char
            loop
               c := s.item(i)
               if c.is_digit then
                  hu_integer_64 := hu_integer_64 * 16 + c.value
               elseif c.is_hexadecimal_digit then
                  hu_integer_64 := hu_integer_64 * 16 + c.hexadecimal_value
               else
                  bad_char := True
               end

               i := i + 1
            end
            if not bad_char then
               hu_parsed := 64
               if hu_integer_64.fit_integer_32 then
                  hu_integer_32 := hu_integer_64.to_integer_32
                  hu_parsed := 32
               end

               if hu_integer_64.fit_integer_16 then
                  hu_integer_16 := hu_integer_64.to_integer_16
                  hu_parsed := 16
               end

               if hu_integer_64.fit_integer_8 then
                  hu_integer_8 := hu_integer_64.to_integer_8
                  hu_parsed := 8
               end
            end
         end
      end

   hu_parsed: INTEGER

   hu_integer_64: INTEGER_64

   hu_integer_32: INTEGER_32

   hu_integer_16: INTEGER_16

   hu_integer_8: INTEGER_8

end -- class HEX_UTIL
