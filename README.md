# equivalence

## install

`stack build && stack install`

## example

```bash
$ ~/.local/bin/equivalence-exe '"a*b"' '["a", "b"]' 100
ε, a, aa, aaa, aaaa, aaaaa, aaaaaa

b, ab, aab, aaab, aaaab, aaaaab

ba, bb, aba, abb, baa, bab, bba, bbb, aaba, aabb, abaa, abab, abba, abbb, baaa, baab, baba, babb, bbaa, bbab, bbba, bbbb, aaaba, aaabb, aabaa, aabab, aabba, aabbb, abaaa, abaab, ababa, ababb, abbaa, abbab, abbba, abbbb, baaaa, baaab, baaba, baabb, babaa, babab, babba, babbb, bbaaa, bbaab, bbaba, bbabb, bbbaa, bbbab, bbbba, bbbbb, aaaaba, aaaabb, aaabaa, aaabab, aaabba, aaabbb, aabaaa, aabaab, aababa, aababb, aabbaa, aabbab, aabbba, aabbbb, abaaaa, abaaab, abaaba, abaabb, ababaa, ababab, ababba, ababbb, abbaaa, abbaab, abbaba, abbabb, abbbaa, abbbab, abbbba, abbbbb, baaaaa, baaaab, baaaba, baaabb, baabaa

```
