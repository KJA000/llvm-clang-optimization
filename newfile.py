import re

# 정규 표현식 패턴 설정
pattern = r'First inference: (\d+).*Inference \(avg\): ([\d.]+)'

# 결과를 저장할 딕셔너리 초기화
results = {}

# 텍스트 파일을 순회하며 평균 추론 시간과 첫 번째 추론 시간 추출
for i in range(1, 101):
    filename = f"{i}.txt"
    with open(filename, 'r') as file:
        content = file.read()
        match = re.search(pattern, content)
        if match:
            first_inference_time = int(match.group(1))
            avg_inference_time = float(match.group(2))
            results[filename] = {'first_inference_time': first_inference_time, 'avg_inference_time': avg_inference_time}
        else:
            print(f"No match found in file: {filename}")

# 결과 출력
for filename, data in results.items():
    print(f"File: {filename}")
    print(f"First inference time: {data['first_inference_time']} us")
    print(f"Avg inference time: {data['avg_inference_time']} us")
    print()