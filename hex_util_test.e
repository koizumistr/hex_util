class HEX_UTIL_TEST

insert
   HEX_UTIL

create {ANY}
   make

feature {ANY}
   make
      do
         test("b")
         test("ab")
         test("1234")
         test("abcd")
         test("fedc")
         test("axb")
         test("abcg")
         test("ffff")
         test("fffff")
         test("ffffffff")
         test("0xabc")
         test("0x")
         test("0X123")
         test("0X0xa")
         test("0x0Xb")
      end

   test (str: STRING)
      do
         std_output.put_string(str + " -> ")
         hu_parse(str)
         std_output.put_character('[')
         std_output.put_integer(hu_parsed)
         std_output.put_character(']')
         std_output.put_new_line
         std_output.put_string("   8: " + hu_integer_8.to_string + "%N")
         std_output.put_string("  16: " + hu_integer_16.to_string + "%N")
         std_output.put_string("  32: " + hu_integer_32.to_string + "%N")
         std_output.put_string("  64: " + hu_integer_64.to_string + "%N")
      end

end -- class HEX_UTIL_TEST
