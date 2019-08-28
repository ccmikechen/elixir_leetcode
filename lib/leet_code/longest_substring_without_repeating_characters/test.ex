defmodule LeetCode.LongestSubstringWithoutRepeatingCharacters.Test do
  use LeetCode.Test, module: LeetCode.LongestSubstringWithoutRepeatingCharacters

  test_cases([
    {["abcabcbb"], 3},
    {["bbbbb"], 1},
    {["pwwkew"], 3},
    {["abc"], 3},
    {["abcdefghijklmnopqrstuvwxyz"], 26},
    {["abcdefghijklmnopqrstuvwxyzyxwvutsrqponmlkjihgfedcba"], 26},
    {[
       "asbfksdbfkdsfklsbdklfbksljdfbkljwbdjfkbwjaklfblkewfliufvkjdsbvkljsbdfklsbkjflbsdfbslkbfskdjbfksdflsdbvsdlkfjbskjdlfbalkfblksjbulisdbksjdbfklsdbfklsbelkfbaskjdlfbslkjdfbjksbdilvcksbdviubwlkjfblkjbfjsdbfosbfjlkawblfkjbsglsdjfbskfbksldbfilksdgblkebgildbvfblikvbsiupqrpqwhemqwejqwbeuoqwdiwqbdlqwncsovgbsudogvbusdbfjkewbiufyqeufeuqf"
     ], 11}
  ])
end
