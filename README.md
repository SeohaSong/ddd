# DDD (DDELA DDOLA DDE)
> ### *"The frameworks for common project."*

## Convention

- Underscore & Dash
	- 명칭이 자세하다면, 컴파일 시간(검색 시간)이 절약된다.
		- 하이픈을 이용하며, 부분 수정이 용이하다.
		- markup, table, exe
	- 명칭이 무손실이면서 간단하다면, 용량이 절약된다.
		- 언더스코어를 이용하며, 전체 수정이 용이하다.
		- code, json, lib

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
