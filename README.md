# DDD (DDELA DDOLA DDE)
> ## *"The core-package for every-project."*
> ### - seohasong -

## Prerequisite
```
Docker (...)
Bash (>= 4.4)
```

## Description (macro)
```
- ddd (core)
공용 코어 프레임워크
    - cmd
        - 독립된 서브루틴
        - cli로 사용하기 적합
        - 인자와 옵션을 전처리해서 받을 수 있음
    - __cmd__
        - 현재 컨택스트를 변경하는 서브루틴
        - cli로 사용하지 않는 것을 권장
        - 인자를 정석 방식으로 받아야함
        - 다른 서브루틴을 가질 수 없음
        - 네임스페이스가 같은 cmd에 적용되는걸 권장
- project
개인화 프레임워크
    - 코어기능과 호환성이 완전해야함
    - 코어기능과 호환성이 완전하도록 코어에 의해 조정됨
```

## Official Patterns
### First
```
    (
        ...+
        ....
    )
```
### Second
```
    (...+
     ....)
```
### Third (Uncontinuous Form)
```
    (
    ...+
    ....)
```
### Fourth (Uncontinuous Form)
```
    (
...+
....)
```

## Flow
1. play -> (run, login) -> stop
1. init -> close
1. confirm
1. help
