# DDD (DDELA DDOLA DDE)
> ### *"The frameworks for common project."*

## Convention

- Underscore & Dash
	- dash
        - 컴파일 시간(검색 시간)을 절약하는 작명 스타일과 어울린다
		- 이름의 부분 수정이 용이하다
		- markup, table, exe
	- Underscore
        - 계층 구조 및 용량을 절약하는 작명 스타일과 어울린다
		- 이름의 전체 수정이 용이하다
		- code, json, lib

- Batchable Process
    - 개별 요소가 서로 상호작용 없이 동일한 방식으로 처리된다
    - 순수함수로 동작해야한다

- M.L.
```
meta
    tokens
    labels
data
    feats
        elems
    reals
data
    recs
        real
        feat
```

- Code
```
self
    _val VAL __val__
    __function function
main
    val _VAL VAL __val__
    __function runFunction
symbol
    i k v d
    idx val_i key2duo key2val_i
    ct sz
grammer
    val val_
    vals valset valer
```

- Abbreviation
  - impossible (callable, public)
  - possible (value, private)
  - one letter (one line scope)

- Annotation
```bash
#
one line
# <>
multiline
multiline
# </>
```

- CRLF
```
asdf(asdf + asdf)
asdf(asdf +
     asdf)
asdf(
  asdf +
  asdf)
asdf(asdf
 + asdf + asdf
 + asdf)
```
