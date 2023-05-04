# channel_sounder
## project 1 : phase error 수정
- compu scope에서 읽은 값의 맨 마지막 값이 orginal paper에서 channel 1에 해당하는 부분인 값이 설정 된경우

## project 4 : phase error 수정
- compu scope에서 읽은 값의 맨 마지막 값이 orginal paper에서 channel 3에 해당하는 부분인 값이 설정 된경우

# code
## 1. corrleatorsimulation
- corrleation peak 값을 만드는 코드

## 2. find_correlationpeak2
- corrleation peak 값을 만드는 코드
출력되는 값은 abs(corr1)의 max 값을 찾는 것이기 때문에,
그 X값의 경우, corr1의 1행 x열의 값을 의미하며, 그 값이 correlation peak에 해당하는 Z=X+jY값에 해당한다.

## 3. newphase_error_solution
- channel 1의 phase의 오차를 보정하는 과정

## 4. newphase_error_solution2
- channel 3의 phase의 오차를 보정하는 과정

## 5. final_solution
- 3,4에서 진행된 channel 1, 3의 보정된 값 사이의 오차를 계산하여, 하나의 Z=X+jY값이 되도록 설정
