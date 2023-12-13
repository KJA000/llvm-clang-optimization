#!/bin/bash

# "test"로 시작하는 모든 실행 파일을 찾아서 100번 실행하고 실행 시간 출력
for file in test*; do
    if [ -x "$file" ]; then
        echo "Executing: $file"
        
        for ((i=1; i<=100; i++)); do
            # 실행 시간 측정
            start_time=$(date +%s%N)
            
            ./"$file" > /dev/null  # 표준 출력을 무시하여 출력이 화면에 나타나지 않도록 함
            
            end_time=$(date +%s%N)
            duration=$(( (end_time - start_time)))  # 나노초
            
            echo "$duration"
        done
        
        echo "-------------------------"
    fi
done

