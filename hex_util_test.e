class HEX_UTIL_TEST

insert
   HEX_UTIL

create {ANY}
   make

feature {ANY}
   make
      do
         test(once "b")
         test(once "ab")
         test(once "1234")
         test(once "abcd")
         test(once "fedc")
         test(once "axb")
         test(once "abcg")
         test(once "ffff")
         test(once "fffff")
         test(once "ffffffff")
         test(once "0xabc")
         test(once "0x")
         test(once "0X123")
         test(once "0X0xa")
         test(once "0x0Xb")
      end

   test (str: STRING)
      do
         std_output.put_string(once "input: " + str + once "%N")
         hu_parse(str)
         std_output.put_string(once " hu_parsed: ")
         std_output.put_integer(hu_parsed)
         std_output.put_new_line
         std_output.put_string(once " hu_integer_8:  " + hu_integer_8.to_string + once "%N")
         std_output.put_string(once " hu_integer_16: " + hu_integer_16.to_string + once "%N")
         std_output.put_string(once " hu_integer_32: " + hu_integer_32.to_string + once "%N")
         std_output.put_string(once " hu_integer_64: " + hu_integer_64.to_string + once "%N")
         std_output.put_string(once "===============%N")
      end

end -- class HEX_UTIL_TEST
